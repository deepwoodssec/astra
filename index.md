---
layout: default
title: Home
nav_order: 1
permalink: /
---

# ASTRA Framework
{: .fs-9 }

Autonomous System Targeting, Reconnaissance & Attack
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

ASTRA structures counter-autonomy engagements into six sequential phases:

| Phase | Name | Function |
|:------|:-----|:---------|
| **A** | [Detection](/astra/docs/methodology/phase-a/) | Discover and characterize the target platform's emissions |
| **B** | [Identification](/astra/docs/methodology/phase-b/) | Identify the platform type, firmware, and protocol stack |
| **C** | [Tracking](/astra/docs/methodology/phase-c/) | Maintain continuous positional awareness of the target |
| **D** | [Decision](/astra/docs/methodology/phase-d/) | Map failsafe logic and select optimal countermeasure |
| **E** | [Engagement](/astra/docs/methodology/phase-e/) | Execute the attack chain against the target |
| **F** | [Exploitation](/astra/docs/methodology/phase-f/) | Extract forensic intelligence from captured platforms |

---

## Five Technique Categories

ASTRA classifies attack techniques into five categories based on which part of the SENSE → DECIDE → ACT loop they target:

| Category | Target | Description |
|:---------|:-------|:------------|
| [**Specter**](/astra/docs/techniques/specter/) | SENSE | Passive reconnaissance — fingerprint emissions, classify platforms, enumerate the loop |
| [**Mirage**](/astra/docs/techniques/mirage/) | SENSE | Active deception — spoof GPS, blind sensors, inject false environmental data |
| [**Fracture**](/astra/docs/techniques/fracture/) | DECIDE | Decision corruption — manipulate failsafe thresholds, poison swarm logic, trigger unintended state transitions |
| [**Override**](/astra/docs/techniques/override/) | ACT | Command injection — send direct commands to flight controllers, bypass motor safeties, force landing or redirect |
| [**Sever**](/astra/docs/techniques/sever/) | Loop Coherence | Timing disruption — desynchronize the SENSE→DECIDE→ACT pipeline, break swarm coordination, inject latency |

---

## Who Maintains ASTRA

ASTRA is developed and maintained by [Deep Woods Security](https://deepwoodssecurity.com), a counter-UAS offensive cybersecurity company based in Virginia Beach, Virginia.

ASTRA is an open methodology. The technique taxonomy is published for the same reason MITRE publishes ATT&CK: a shared language for describing attacks makes the entire community stronger. The specific exploit implementations, tested attack chains, and platform vulnerability data that operationalize ASTRA are maintained separately in the [Deep Woods Sentinel](https://deepwoodssecurity.com) product line.

---

## License

ASTRA is released under the [MIT License](https://github.com/deepwoodssec/astra/blob/main/LICENSE). Use it, extend it, cite it.

When referencing ASTRA in publications or reports:

> Deep Woods Security. *ASTRA: Autonomous System Targeting, Reconnaissance & Attack Framework.* 2026. https://deepwoodssec.github.io/astra
