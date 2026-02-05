---
layout: default
title: "Fracture"
parent: Techniques
nav_order: 3
permalink: /docs/techniques/fracture/
---

# Fracture — DECIDE Loop Corruption
{: .fs-8 }

Corrupt how the platform thinks.
{: .fs-5 .fw-300 }

---

## Classification

| Attribute | Value |
|:----------|:------|
| **Type** | Active — alters target state |
| **Target** | DECIDE loop |
| **Effect** | Platform makes decisions that serve the defender |
| **Phases** | Primarily Phase E, informed by Phase F (pre-engagement RE) |
| **Hardening Viability** | Tier 0-2: viable where decision logic is understood. Tier 3: requires novel research |

---

## Definition

Fracture corrupts the platform's decision-making. Where Mirage feeds false data to SENSE, Fracture targets the logic that interprets that data. The platform may perceive the world accurately but reach incorrect conclusions — or its decision thresholds may be manipulated to trigger state transitions at attacker-chosen times.

Fracture operates at two scales:

- **Single-platform decision manipulation** — exploiting the autonomous decision logic of an individual platform
- **Multi-platform swarm logic corruption** — poisoning coordination protocols that enable collective behavior

---

## Single-Platform Techniques

Applicable to any platform with documented or reverse-engineered decision logic. Validated through failsafe mapping (Phase F pre-engagement / teardown Phase 9).

### Failsafe Threshold Manipulation

Every autonomous platform has conditional logic: IF condition X, THEN action Y. Fracture manipulates the inputs evaluated against those thresholds.

| Threshold | Manipulation | Effect |
|:----------|:------------|:-------|
| Altitude floor (e.g., 40m) | GPS altitude spoof below threshold | Forces VTOL motor engagement |
| VTOL-assisted altitude (e.g., 30m) | GPS altitude spoof below 30m | Forces full VTOL stabilization — max power draw |
| Roll limit (e.g., >30°) | GPS spoof induces navigation corrections exceeding attitude limit | Forces VTOL stabilization failsafe |
| Stall speed (e.g., <18 m/s) | GPS velocity spoof corrupts airspeed failover | Forces VTOL motor engagement |
| Battery voltage (e.g., <41V) | Indirect — force high-consumption state via other thresholds | Forces Q-LAND |
| Airspeed-ground speed delta (e.g., >20 m/s) | GPS ground speed spoof | Forces airspeed failover |

The distinction between Fracture and Mirage: the GPS spoof is the delivery mechanism (Mirage). The failsafe threshold crossing is the effect (Fracture). In practice, Mirage and Fracture are often chained.

### State Machine Exploitation

Force the platform through unintended state transitions:

- AUTO → RTL by triggering the appropriate failsafe
- Fixed-wing cruise → VTOL hover by triggering attitude/altitude thresholds
- Armed → disarmed by exploiting pre-arm check logic in reverse

Each forced transition consumes time, battery, and operator attention.

### Geofence Exploitation

Spoof the platform's position to appear outside its geofence boundary. The platform's own safety feature triggers geofence-breach behavior (typically RTL or landing).

---

## Multi-Platform Techniques (Forward-Positioned)

These target platforms coordinating via mesh networking, swarm protocols, or shared situational awareness. Emerging capability area.

### Swarm Logic Poisoning

Inject false peer data into swarm coordination protocols — false position reports, false task assignments, false obstacle detections. Corrupting collective input corrupts collective behavior.

### Autonomous Negotiation Corruption

Disrupt task allocation by injecting conflicting assignments or spoofing task completion messages.

### Coordination Clock Disruption

Introduce timing offsets between platforms. If platform A is at T+0 and platform B at T+200ms, coordinated behavior degrades.

---

## Fracture vs. Hardening

| Hardening | Impact on Fracture |
|:----------|:------------------|
| Authenticated sensor inputs | Reduces delivery vectors |
| Redundant decision inputs | Single-input manipulation may be detected |
| Adaptive thresholds | Fixed threshold exploitation becomes unreliable |
| Authenticated swarm protocols | Swarm poisoning requires defeating authentication |
| Byzantine fault tolerance | Requires corrupting N+1 peers |

Fracture remains viable at higher hardening tiers than Override because decision logic complexity creates a larger attack surface than communication protocol security. Even authenticated, encrypted systems must still make decisions — and those decisions have exploitable logic.
