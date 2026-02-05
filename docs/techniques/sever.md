---
layout: default
title: "Sever"
parent: Techniques
nav_order: 5
permalink: /docs/techniques/sever/
---

# Sever — Operational Continuity Disruption
{: .fs-8 }

Disrupt the platform's ability to sustain operations.
{: .fs-5 .fw-300 }

---

## Classification

| Attribute | Value |
|:----------|:------|
| **Type** | Active — alters target state |
| **Target** | SENSE → DECIDE → ACT loop continuity |
| **Effect** | Platform cannot sustain its operational loop |
| **Phases** | Primarily Phase E (Engagement) |
| **Hardening Viability** | Tier 0-2: viable. Tier 3: reduced but not eliminated — physics cannot be patched |

---

## Definition

Sever disrupts the platform's ability to sustain its SENSE → DECIDE → ACT loop as a continuous operation. Where Mirage corrupts SENSE, Fracture corrupts DECIDE, and Override corrupts ACT, Sever degrades the **coherence and continuity** of the entire loop.

Three domains:

- **Resource exhaustion** — deplete finite consumables faster than the mission plan accounts for
- **Communication denial** — sever links between the platform and its operator, GCS, or peers
- **Timing disruption** — desynchronize coordinated operations

The common thread: the loop may be individually intact at each stage, but the system as a whole can no longer sustain operations.

---

## Domain 1: Resource Exhaustion

Every platform operates on a finite energy budget. Sever forces higher-consumption states, collapsing the budget ahead of schedule.

### Power Budget Exploitation

| Technique | Mechanism | Target |
|:----------|:----------|:-------|
| VTOL motor forcing | Trigger failsafes that engage VTOL motors during cruise | VTOL hybrids with separate battery systems |
| Hover trapping | Force into hover via GPS denial or mode injection | Multirotor and VTOL platforms |
| Altitude cycling | Repeated climb/descent via threshold manipulation | Any platform with altitude-hold logic |

For platforms with separate VTOL and cruise batteries, forcing VTOL motor engagement during fixed-wing flight drains the VTOL packs at 10-15x the cruise power rate. When voltage drops below the critical threshold, the platform executes a forced landing regardless of remaining cruise battery.

The platform defeats itself. You are making its safety systems work against its mission.

---

## Domain 2: Communication Denial

RF jamming severs communication links between the platform and external systems.

### Jamming Modes

| Mode | Mechanism | Effect |
|:-----|:----------|:-------|
| **Broadband noise** | High-power noise across target band | Denies all communication. Indiscriminate |
| **Targeted jamming** | Noise on specific frequency/channel | Denies target link, minimizes collateral |
| **Protocol-aware** | Transmit during target's receive windows only | Lower power, harder to detect |

Communication denial triggers comm-loss failsafe behavior. For autonomous platforms (mission continues on RC/GCS loss), jamming alone may not terminate the mission — it isolates the platform from operator override. Tactically useful when combined with other categories: jam the control link (Sever) while spoofing GPS (Mirage) to redirect an isolated platform.

ASTRA acknowledges communication denial as a baseline technique that existing systems (JCREW/DRAKE, MADIS, LMADIS) already provide. ASTRA's value proposition is precision exploitation, not brute-force denial — but jamming remains a valid Sever technique in the toolkit.

### Legal Note

RF jamming is heavily regulated. Intentional interference is prohibited outside authorized military or law enforcement operations in most jurisdictions.

---

## Domain 3: Timing Disruption

Multi-platform operations depend on synchronized timing. Disrupting timing coherence degrades coordinated behavior without necessarily affecting individual operation.

| Technique | Mechanism | Effect |
|:----------|:----------|:-------|
| GPS time spoofing | Spoof GPS time-of-week to create clock offsets | Coordinated maneuvers desynchronize |
| Mesh latency injection | Inject delays into inter-platform communication | Real-time coordination degrades |
| Coordination clock drift | Gradually offset individual clocks | Cumulative desynchronization |

Forward-positioned capability. Current single-platform targets do not require timing attacks. Becomes primary as swarm operations mature.

---

## Sever vs. Hardening

| Hardening | Impact on Sever |
|:----------|:---------------|
| Larger battery | Extends time-to-effect, does not eliminate |
| Anti-jam waveforms | Increases jammer power requirement |
| Autonomous operation (no comm dependency) | Communication denial becomes irrelevant |
| Authenticated timing | Timing disruption requires defeating authentication |
| Redundant power | Requires exhausting multiple systems |

Sever is the most durable active category because it exploits physics rather than protocol weaknesses. You can encrypt a communication link. You cannot encrypt a battery.

---

*"The river does not attack the stone. It surrounds it, and the stone diminishes."*
