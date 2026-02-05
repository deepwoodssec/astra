---
layout: default
title: Methodology
nav_order: 2
has_children: true
---

# ASTRA Methodology
{: .fs-8 }

Six phases. Sequential with one exception.
{: .fs-5 .fw-300 }

---

## Phase Sequence

Phases A through E are sequential — each produces intelligence that the next phase requires. Phase F is non-linear. It operates in two modes that wrap around the engagement cycle:

```
F (pre-engagement) → informs → D (decision) → E (engagement)
                                                     ↓
                                              F (post-engagement)
```

- **Pre-engagement intelligence** (Phase F, Mode 1): Firmware extraction, reverse engineering, vulnerability discovery. This must be completed before Phase D can produce reliable countermeasure recommendations.
- **Post-engagement forensics** (Phase F, Mode 2): Mission log recovery, component attribution, operational intelligence. This follows Phase E when a platform is recovered.

Specter (continuous passive collection) runs across all phases as a persistent thread — not just during Phase A.

---

## Phases

| Phase | Name | Output | Feeds |
|:------|:-----|:-------|:------|
| **A** | [Detection](/astra/docs/methodology/phase-a/) | RF, acoustic, radar signatures | Phase B classification |
| **B** | [Identification](/astra/docs/methodology/phase-b/) | Platform type, firmware version, protocol stack | Phase C tracking parameters, Phase D vulnerability profile |
| **C** | [Tracking](/astra/docs/methodology/phase-c/) | Position, bearing, velocity estimates | Phase E targeting data |
| **D** | [Decision](/astra/docs/methodology/phase-d/) | Ranked countermeasure list with success probability | Phase E engagement plan |
| **E** | [Engagement](/astra/docs/methodology/phase-e/) | Countermeasure execution, measured results | Database update, Phase F post-engagement |
| **F** | [Exploitation](/astra/docs/methodology/phase-f/) | Pre: vulnerability intelligence. Post: attribution data | Pre feeds D and E. Post feeds intelligence analysis |

---

## Relationship to Technique Categories

The six phases describe **when** and **in what order**. The five technique categories (Specter, Mirage, Fracture, Override, Sever) describe **what kind of action**. They are orthogonal:

- Phase A (Detection) primarily employs **Specter** techniques
- Phase E (Engagement) employs **Mirage**, **Fracture**, **Override**, or **Sever** depending on the target
- **Specter** runs continuously across all phases — it provides real-time feedback during engagement and maintains environmental awareness between engagements

The phases are a timeline. The technique categories are a toolbox. Phase D selects from the toolbox based on what the timeline has revealed.
