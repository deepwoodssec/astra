---
layout: default
title: Techniques
nav_order: 3
has_children: true
permalink: /docs/techniques/
---

# ASTRA Technique Categories
{: .fs-8 }

Five categories. One loop to break.
{: .fs-5 .fw-300 }

---

## Overview

ASTRA classifies offensive techniques against autonomous systems into five categories. Each category targets a specific stage of the **SENSE → DECIDE → ACT** loop.

The categories are a taxonomy — a classification system for attack techniques. They are not tools or software. An engagement report references technique categories the same way a network pentest report references MITRE ATT&CK techniques: as a common language for describing what was done and why it worked.

## The Five Categories

```
              SENSE → DECIDE → ACT
                │        │       │
          ┌─────┤    ┌───┤   ┌───┤
          │     │    │   │   │   │
       Specter  │  Fracture │ Override
       (recon)  │  (corrupt)│ (inject)
                │           │
             Mirage       Sever
             (deceive)    (disrupt)
```

| Category | Loop Target | Posture | Primary Effect |
|:---------|:------------|:--------|:---------------|
| [**Specter**](/astra/docs/techniques/specter/) | SENSE | Passive | Reconnaissance — observe without alerting |
| [**Mirage**](/astra/docs/techniques/mirage/) | SENSE | Active | Deception — feed false data to sensors |
| [**Fracture**](/astra/docs/techniques/fracture/) | DECIDE | Active | Corruption — make the platform decide wrong |
| [**Override**](/astra/docs/techniques/override/) | ACT | Active | Injection — send direct commands to actuators |
| [**Sever**](/astra/docs/techniques/sever/) | Loop Coherence | Active | Disruption — break the pipeline between stages |

## Category Relationships

Categories are not mutually exclusive. Most attack chains combine multiple categories:

**Specter → Mirage:** Passive fingerprinting identifies GPS dependency, enabling targeted GPS spoofing.

**Mirage → Fracture:** GPS spoofing triggers failsafe state transitions, which can be chained to force the platform through a predictable behavioral sequence.

**Fracture → Override:** Failsafe manipulation forces the platform into a mode where command injection is possible (e.g., forcing a mode change that disables authentication).

**Override → Sever:** Command injection forces continuous VTOL motor engagement, draining batteries — a power-based denial of service.

**Specter** is almost always the first category employed. You must observe before you can deceive, corrupt, inject, or disrupt.

## Mapping to ASTRA Phases

| Phase | Primary Categories Used |
|:------|:-----------------------|
| A — Detection | Specter |
| B — Identification | Specter |
| C — Tracking | Specter |
| D — Decision | (Analysis, not technique execution) |
| E — Engagement | Mirage, Fracture, Override, Sever |
| F — Exploitation | (Post-engagement analysis) |

Phases A-C are almost entirely **Specter** — passive observation and classification. Phase E is where **Mirage**, **Fracture**, **Override**, and **Sever** are employed. Phase D is analytical (no techniques executed) and Phase F is forensic (techniques applied to captured hardware, not airborne platforms).

## Reporting Convention

In ASTRA-structured reports, each technique employed during an engagement is tagged with its category:

```
Finding: GPS position spoofing redirected target platform 2.3 km 
         east of intended waypoint.
Category: Mirage
Phase: E (Engagement)
Technique: MIRAGE-001 — GPS L1 C/A Signal Spoofing
Platform: [PLT-XXX]
Result: SUCCESS — platform followed spoofed position for 47 seconds
        before operator intervention.
```

This convention enables cross-engagement comparison: which categories are most effective against which platform classes? Which categories does a specific platform resist? Where are the gaps?
