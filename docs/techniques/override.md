---
layout: default
title: "Override"
parent: Techniques
nav_order: 4
permalink: /docs/techniques/override/
---

# Override — ACT Loop Commandeering
{: .fs-8 }

Command what the platform does.
{: .fs-5 .fw-300 }

---

## Classification

| Attribute | Value |
|:----------|:------|
| **Type** | Active — alters target state |
| **Target** | ACT loop |
| **Effect** | Platform executes attacker-issued commands |
| **Phases** | Primarily Phase E (Engagement) |
| **Hardening Viability** | Tier 0: high. Tier 1+: requires bypass of authentication/encryption |

---

## Definition

Override bypasses or supplants the platform's intended command authority, injecting commands executed as if they came from the legitimate operator. The most direct form of counter-autonomy attack.

Override is also the most fragile category against hardening. Any form of command authentication directly defeats basic Override. Highest reward against unhardened targets, lowest durability as adversaries mature.

---

## Primary Technique: MAVLink Command Injection

MAVLink is the standard protocol for ArduPilot and PX4. In default COTS configuration, MAVLink is unencrypted and unsigned — any device transmitting properly formatted packets on the correct frequency will have commands accepted.

### Injection Commands

| Command | Effect |
|:--------|:-------|
| MAV_CMD_NAV_LAND | Immediate landing at current position |
| MAV_CMD_NAV_RETURN_TO_LAUNCH | Return to home (combine with Mirage: spoof home to capture point) |
| MAV_CMD_NAV_WAYPOINT | Overwrite or insert mission waypoints |
| MAV_CMD_COMPONENT_ARM_DISARM | Disarm motors |
| MAV_CMD_DO_SET_MODE | Change flight mode |
| MAV_CMD_DO_FLIGHTTERMINATION | Terminate flight (if implemented) |

### Requirements

| Requirement | Detail |
|:------------|:-------|
| Frequency | Target's telemetry/command frequency (900 MHz, 433 MHz, or 2.4 GHz) |
| System ID | MAVLink system ID (default GCS = 255). Some firmware accepts any source |
| Packet format | Correct MAVLink version (v1 or v2) with valid CRC |
| Power | Signal receivable at target's radio. Directional antenna extends range |

### Override + Mirage Chain

Inject MAV_CMD_NAV_RETURN_TO_LAUNCH while GPS-spoofing the home position to a capture point. The platform returns "home" — to wherever the attacker defines home to be.

---

## Secondary Techniques

### Proprietary Protocol Injection

DJI, Parrot, Skydio use proprietary protocols. Override requires protocol reverse engineering (Phase F pre-engagement). Once the protocol is understood, injection follows the same principle.

### Kill Switch Exploitation

Hardware or software flight termination systems. If the command is known and the channel is accessible, a single packet terminates flight.

### Motor Controller Bypass

ESCs accept PWM or digital protocol commands directly. If signals can be injected on the motor control bus, individual motors can be commanded independently of the flight controller.

---

## Override vs. Hardening

| Hardening | Impact on Override |
|:----------|:------------------|
| MAVLink v2 signing | Commands without valid key rejected |
| Encrypted command link | Cannot craft valid packets without key |
| Frequency hopping | Must track hopping sequence |
| System ID filtering | Must know correct system ID |
| Command rate limiting | Flood-style injection throttled |

Override is the first category to fail as the adversary hardens. At Tier 1, Override requires cryptographic bypass. This is why ASTRA maintains Mirage, Fracture, and Sever as parallel paths.
