---
layout: default
title: "Phase F — Exploitation"
parent: Methodology
nav_order: 6
permalink: /docs/methodology/phase-f/
---

# Phase F — Exploitation
{: .fs-8 }

Extract intelligence before and after engagement.
{: .fs-5 .fw-300 }

---

## Objective

Phase F operates in **two modes** that bookend the engagement cycle:

- **Pre-engagement intelligence** — firmware extraction, reverse engineering, vulnerability discovery that informs Phase D and Phase E
- **Post-engagement forensics** — mission data recovery, component attribution, operational intelligence from captured or recovered platforms

Phase F is the only non-linear phase in ASTRA. Pre-engagement intelligence must be completed before Phase D can produce reliable recommendations. Post-engagement forensics occurs after Phase E achieves a recovery.

---

## Mode 1: Pre-Engagement Intelligence

Transforms physical access to a platform into the vulnerability intelligence that makes Phases D and E effective.

### Firmware Extraction

| Method | Tool | Access Required |
|:-------|:-----|:---------------|
| SPI flash dump | SOIC clip + flashrom | Physical — flash chip |
| SWD/JTAG debug | J-Link, ST-Link, OpenOCD | Physical — debug pads |
| UART boot log | USB-UART adapter | Physical — debug UART |
| SD card extraction | Card reader | Physical — SD slot |
| USB firmware download | Mission Planner / QGroundControl | USB to flight controller |

### Firmware Analysis

Key targets in Ghidra (ARM Cortex-M for Pixhawk-class controllers):

- **Failsafe handler functions** — verify firmware behavior matches documentation. Discrepancies are high-value findings.
- **MAVLink parser** — is signing compiled in, enabled, or absent? Which commands are accepted without authentication?
- **GPS validation** — does firmware sanity-check position data? Detect sudden jumps? Cross-reference against IMU?
- **OTA update mechanism** — can firmware be reflashed over the air? What authentication is required?
- **Cryptographic key storage** — hardcoded in flash? Derived at runtime? Absent?
- **Debug/engineering modes** — hidden commands, factory test modes, backdoor access

### CVE Assessment

Compare extracted firmware version against public vulnerability databases and the autopilot project's changelog. For open-source autopilots (ArduPilot, PX4), every bug fix between the extracted version and current release is a potential exploit.

### Output: Vulnerability Profile

| Output | Database Destination |
|:-------|:--------------------|
| Firmware binary + hash | `firmware` table |
| Ghidra project | `firmware.ghidra_project_path` |
| Verified failsafe behavior | `failsafe_logic` table |
| Applicable CVEs | `firmware.known_cves` |
| Cryptographic assessment | `firmware` notes |
| Debug interface availability | `components.debug_interface` |

---

## Mode 2: Post-Engagement Forensics

Extracts operational intelligence from a platform recovered after engagement.

### Mission Data Recovery

| Data Source | Intelligence Value |
|:------------|:------------------|
| Mission logs (SD card) | Flight path, timestamps, sensor data, operator commands |
| Waypoint file | Planned route — launch point, target area, return point |
| Home position | Where it was launched from |
| GPS almanac / ephemeris | Geographic region of last valid fix |
| Telemetry logs | GCS communication history |
| Camera/sensor data | ISR collection from the mission |

### Component Attribution

| Data Point | Intelligence Value |
|:-----------|:------------------|
| IC manufacturer and part numbers | Supply chain origin |
| PCB date codes and batch numbers | Manufacturing timeline |
| Firmware compilation metadata | Build environment, timestamps |
| Stored WiFi SSIDs / paired devices | Operational history |
| Calibration data | Where and when last calibrated |

---

## Why Phase F is Non-Linear

```
Phase F (pre-engagement) → feeds → Phase D → Phase E
Phase E → feeds → Phase F (post-engagement)
```

Phase F wraps around the engagement cycle. It provides the intelligence that enables engagement and extracts the intelligence that engagement makes possible. A common misreading of kill chain models is that the last phase happens last. In ASTRA, Phase F's pre-engagement mode is a prerequisite for Phase D.

---

