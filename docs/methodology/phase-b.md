---
layout: default
title: "Phase B — Identification"
parent: Methodology
nav_order: 2
permalink: /docs/methodology/phase-b/
---

# Phase B — Identification
{: .fs-8 }

Name the platform.
{: .fs-5 .fw-300 }

---

## Objective

Classify the detected platform by type, manufacturer, firmware version, and protocol stack. Phase B transforms a detection into an identification — from "something is there" to "it is a specific platform with known characteristics."

Identification connects detection to the vulnerability database. Without Phase B, every platform is a generic blip. With Phase B, the system knows what it's looking at and can query for known vulnerabilities, failsafe behavior, and tested countermeasures.

---

## Identification Methods

### Protocol Fingerprinting

Autonomous platforms running MAVLink (ArduPilot, PX4) broadcast identifying information in their telemetry stream. The HEARTBEAT message (message ID 0) transmits once per second and contains:

- `autopilot` field — identifies the autopilot stack (ArduPilot = 3, PX4 = 12)
- `type` field — identifies the vehicle class (fixed-wing = 1, quadrotor = 2, VTOL = 20)
- `system_status` — current operational state
- `mavlink_version` — protocol version

If the telemetry link is unencrypted (common in COTS configurations), passive reception of the HEARTBEAT positively identifies the autopilot family and vehicle type without any interaction with the target.

### RF Signature Matching

The combination of emission characteristics — telemetry frequency, RC frequency, modulation type, bandwidth, hopping pattern — creates a composite RF fingerprint matched against the classification library:

- 900 MHz SiK telemetry + 2.4 GHz FHSS RC → ArduPilot ecosystem
- 2.4 GHz + 5.8 GHz wideband OFDM → DJI OcuSync ecosystem
- Single 2.4 GHz narrowband → toy-grade or custom build

### Acoustic Signature Matching

Spectral features from acoustic recordings (blade passage frequency, harmonic structure, motor count) match against known profiles. A four-motor hover signature differs from a five-motor VTOL (four VTOL + one pusher), which differs from a six-motor hexacopter.

### Radar Signature Matching

RCS magnitude and micro-Doppler blade signature provide platform-class discrimination. A 3.3m wingspan fixed-wing presents a different radar return than a 350mm quadcopter. Micro-Doppler patterns encode motor count and blade configuration.

---

## Classification Hierarchy

```
Level 1: Platform class (multirotor / fixed-wing / VTOL hybrid / ground / surface)
    ↓
Level 2: Autopilot family (ArduPilot / PX4 / DJI / proprietary / unknown)
    ↓
Level 3: Vehicle type (specific model or model class)
    ↓
Level 4: Firmware version (if determinable from telemetry)
```

Each level narrows the database search space. Level 1 alone is insufficient for countermeasure selection — a VTOL running DJI firmware requires entirely different techniques than a VTOL running ArduPilot. Level 2 or deeper is required for Phase D.

---

## Phase B Outputs

| Output | Format | Feeds |
|:-------|:-------|:------|
| Platform classification (class, family, type, version) | Structured record | Phase D countermeasure selection |
| Confidence level per classification tier | Percentage | Phase D decision weighting |
| MAVLink telemetry decode (if available) | PCAP, decoded fields | Phase D failsafe analysis |
| RF fingerprint record | Feature vector | Classification library update |

---

