---
layout: default
title: "Specter"
parent: Techniques
nav_order: 1
permalink: /docs/techniques/specter/
---

# Specter — Continuous Passive Intelligence
{: .fs-8 }

The thread that never stops.
{: .fs-5 .fw-300 }

---

## Classification

| Attribute | Value |
|:----------|:------|
| **Type** | Persistent passive collection |
| **Target** | SENSE → DECIDE → ACT (all stages) |
| **Effect** | None — Specter does not alter the target's state |
| **Phases** | All (A through F, continuously) |
| **Hardening Viability** | Tier 0–3 — always viable while target emits |

---

## Definition

Specter is continuous passive intelligence collection. Unlike Mirage, Fracture, Override, and Sever — which change the target's state — Specter observes without affecting.

Specter is not synonymous with Phase A or Phase B. Those are events in a timeline. Specter is a **persistent operational state**:

- **Before engagement:** Detects, classifies, and tracks (supporting Phases A-C)
- **During engagement:** Monitors the target's response to countermeasures in real time
- **After engagement:** Confirms outcome, detects recovery or adaptation
- **Between engagements:** Maintains environmental awareness

---

## Techniques

### Passive RF Fingerprinting

Monitor the electromagnetic spectrum across autonomous platform bands without transmitting.

| Parameter | What It Tells You |
|:----------|:-----------------|
| Center frequency | Band and likely protocol |
| Bandwidth | Narrowband telemetry vs. wideband video |
| Modulation type | FSK, OFDM, FHSS — narrows platform family |
| Hopping pattern | FHSS sequence identifies protocol |
| Duty cycle | Continuous vs. burst patterns |
| Power level | Range estimation, platform size |

### Protocol Decoding

For unencrypted protocols (MAVLink without signing, many proprietary RC links), decode the data layer to extract platform identity, status, position, and mission parameters.

### Sensor Enumeration

| Observable | Inference |
|:-----------|:---------|
| Position hold behavior | GPS receiver present and trusted |
| Altitude hold precision | Barometric altimeter present |
| Obstacle avoidance | Forward/downward sensors present |
| Stable hover in wind | IMU + compass quality |

### SENSE → DECIDE → ACT Loop Enumeration

Map the complete loop by observing behavior under varying conditions: what does it sense, how does it decide, how does it act? This feeds Phase D with behavioral intelligence that may not be available from firmware analysis alone.

---

## Specter as Engagement Feedback

During Phase E, Specter closes the observation loop:

| Countermeasure | Specter Observable |
|:--------------|:------------------|
| GPS spoof → redirect | Telemetry shows position shift toward spoofed coordinates |
| Command injection → force land | Telemetry shows descent rate change |
| Resource exhaustion → battery drain | Telemetry shows voltage drop rate |

Without Specter during engagement, the operator has no feedback. Specter tells you whether it's working.

---

*"The wolf watches the camp all night. Not to attack — to know."*
