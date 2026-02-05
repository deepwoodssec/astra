---
layout: default
title: Home
nav_order: 1
permalink: /
---

# ASTRA Framework
{: .fs-9 }

Autonomous System Targeting, Reconnaissance and Attack
{: .fs-6 .fw-300 }

A six-phase counter-autonomy red team methodology for attacking unmanned and autonomous systems.
{: .fs-5 .fw-300 }

[Methodology](/astra/docs/methodology/){: .btn .btn-primary .fs-5 .mb-4 .mb-md-0 .mr-2 }
[Techniques](/astra/docs/techniques/){: .btn .fs-5 .mb-4 .mb-md-0 }

---

## What is ASTRA?

ASTRA is a structured methodology for conducting offensive security assessments against autonomous systems — unmanned aerial systems (UAS), unmanned ground vehicles (UGV), autonomous maritime platforms, and robotic systems.

Every autonomous system operates on a loop: **SENSE → DECIDE → ACT**. The platform senses its environment, decides what to do, and acts on that decision. ASTRA provides a systematic approach to attacking each stage of that loop.

ASTRA is to counter-autonomy what [MITRE ATT&CK](https://attack.mitre.org/) is to enterprise security: a published taxonomy that structures offensive engagements, standardizes reporting, and establishes a common language for describing attacks against autonomous systems.

---

## The Problem

Counter-autonomy today is dominated by **defensive** solutions: detect, track, jam, shoot. Radar sees a drone. Electronic warfare jams its signal. A kinetic interceptor destroys it.

These solutions assume the threat is **dumb** — a radio-controlled aircraft that stops working when you break the radio link.

Modern autonomous platforms don't need a radio link. They navigate by GPS. They follow pre-programmed waypoints. They make decisions onboard. RF jamming doesn't stop them. It just isolates the operator — the mission continues.

ASTRA addresses the gap: **offensive cyber operations against autonomous systems**. Not jamming the link — exploiting the firmware. Not tracking the drone — injecting commands into the flight controller. Not shooting it down — redirecting it to land where you want it.

---

## SENSE → DECIDE → ACT

The foundational model behind ASTRA.

| Loop Stage | Function | What It Does | ASTRA Attacks |
|:-----------|:---------|:-------------|:--------------|
| **SENSE** | Perception | GPS, IMU, camera, LIDAR, barometer, airspeed sensor | Spoof sensors, blind cameras, inject false position data |
| **DECIDE** | Cognition | Failsafe logic, waypoint sequencing, geofence enforcement, swarm negotiation | Corrupt decision thresholds, poison swarm consensus, manipulate failsafe triggers |
| **ACT** | Actuation | Motor controllers, control surfaces, payload release, communication links | Inject flight commands, bypass kill switches, force motor states |

The loop is only as strong as its weakest stage. ASTRA finds the weakest stage and breaks it.

---

## Six Phases

ASTRA structures counter-autonomy engagements into six phases. Phases A through E are sequential. Phase F is non-linear — it operates in two modes that bookend the engagement cycle.

| Phase | Name | Function |
|:------|:-----|:---------|
| **A** | [Detection](/astra/docs/methodology/phase-a/) | Discover and characterize the target platform's emissions |
| **B** | [Identification](/astra/docs/methodology/phase-b/) | Identify the platform type, firmware, and protocol stack |
| **C** | [Tracking](/astra/docs/methodology/phase-c/) | Maintain continuous positional awareness of the target |
| **D** | [Decision](/astra/docs/methodology/phase-d/) | Map failsafe logic and select optimal countermeasure |
| **E** | [Engagement](/astra/docs/methodology/phase-e/) | Execute the attack chain against the target |
| **F** | [Exploitation](/astra/docs/methodology/phase-f/) | Extract intelligence before engagement (vulnerability research) and after engagement (forensics and attribution) |

Phase F pre-engagement intelligence (firmware extraction, reverse engineering, vulnerability discovery) feeds Phase D and Phase E. Phase F post-engagement forensics (mission log recovery, component attribution) follows Phase E. The framework is a cycle, not a straight line.

---

## Five Technique Categories

ASTRA classifies attack techniques into five categories. Four are active — they change the target's state. One is persistent — it collects intelligence continuously without affecting the target.

| Category | Target | Description |
|:---------|:-------|:------------|
| [**Specter**](/astra/docs/techniques/specter/) | Continuous collection | Persistent passive intelligence — RF fingerprinting, protocol decoding, behavioral observation. Runs across all phases, not just reconnaissance |
| [**Mirage**](/astra/docs/techniques/mirage/) | SENSE loop | Active deception — spoof GPS, blind sensors, inject false environmental data |
| [**Fracture**](/astra/docs/techniques/fracture/) | DECIDE loop | Decision corruption — manipulate failsafe thresholds, trigger unintended state transitions, poison swarm logic |
| [**Override**](/astra/docs/techniques/override/) | ACT loop | Command injection — send direct commands to flight controllers, bypass motor safeties, force landing or redirect |
| [**Sever**](/astra/docs/techniques/sever/) | Loop continuity | Operational disruption — exhaust finite resources, deny communications, desynchronize coordinated operations |

---

## Adversary Hardening Tiers

ASTRA techniques do not apply uniformly across all targets. The [hardening tier classification](/astra/docs/hardening-tiers/) maps target sophistication to technique viability.

| Tier | Classification | Technique Viability |
|:-----|:--------------|:-------------------|
| **0** | COTS Unmodified | All categories viable — the current baseline threat |
| **1** | Protocol-Hardened | Override requires bypass; Mirage, Fracture, Sever remain viable |
| **2** | Sensor-Hardened | Mirage requires sophistication; Fracture and Sever become primary |
| **3** | Full-Stack Hardened | Novel zero-day or physical-layer attacks only |

The threat landscape is moving from Tier 0 toward Tier 2. ASTRA is designed for this trajectory. The technique categories that survive hardening — Fracture and Sever — exploit decision logic complexity and physical constraints that cannot be patched away.

---

## Who Maintains ASTRA

ASTRA is developed and maintained by [Deep Woods Security](https://deepwoodssec.com), a boutique offensive security firm based in Virginia Beach. Deep Woods specializes in penetration testing, red team operations, and AI security for organizations where failure isn't an option.

ASTRA is an open methodology. The technique taxonomy is published for the same reason MITRE publishes ATT&CK: a shared language for describing attacks makes the entire community stronger. The specific exploit implementations, tested attack chains, and platform vulnerability data that operationalize ASTRA are maintained separately in the [Deep Woods Sentinel](https://deepwoodssec.com) product line.

---

## License

ASTRA is released under the [MIT License](https://github.com/deepwoodssec/astra/blob/main/LICENSE). Use it, extend it, cite it.

When referencing ASTRA in publications or reports:

> Deep Woods Security. *ASTRA: Autonomous System Targeting, Reconnaissance and Attack Framework.* 2026. https://deepwoodssec.github.io/astra
