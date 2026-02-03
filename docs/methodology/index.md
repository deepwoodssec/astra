---
layout: default
title: Methodology
nav_order: 2
has_children: true
permalink: /docs/methodology/
---

# ASTRA Methodology
{: .fs-8 }

Six phases. One kill chain. From first detection to forensic exploitation.
{: .fs-5 .fw-300 }

---

## Structure

An ASTRA engagement follows six sequential phases. Each phase builds on the output of the previous one. Skipping phases creates blind spots. The methodology is designed to be executed in order, though mature operators may compress or parallelize phases based on prior intelligence.

```
┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│  Phase A     │───▶│  Phase B     │───▶│  Phase C     │
│  DETECTION   │    │  IDENTIFY    │    │  TRACKING    │
│              │    │              │    │              │
│  Find it     │    │  Know it     │    │  Follow it   │
└─────────────┘    └─────────────┘    └─────────────┘
       │                  │                  │
       ▼                  ▼                  ▼
   RF, radar,        Protocol,          Direction-
   acoustic,         firmware,          finding,
   visual/IR         version ID         triangulation
                                             │
                                             ▼
┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│  Phase F     │◀───│  Phase E     │◀───│  Phase D     │
│  EXPLOIT     │    │  ENGAGEMENT  │    │  DECISION    │
│              │    │              │    │              │
│  Learn it    │    │  Break it    │    │  Choose how  │
└─────────────┘    └─────────────┘    └─────────────┘
       │                  │                  │
       ▼                  ▼                  ▼
   Firmware          GPS spoof,         Failsafe map,
   extraction,       MAVLink inject,    countermeasure
   forensics,        RF denial,         selection,
   attribution       power drain        decision engine
```

## Phase Summary

| Phase | Name | Input | Output | SENSE→DECIDE→ACT Target |
|:------|:-----|:------|:-------|:------------------------|
| **A** | [Detection](/astra/docs/methodology/phase-a/) | Operational environment | RF/radar/acoustic/visual signatures | Observing the SENSE stage |
| **B** | [Identification](/astra/docs/methodology/phase-b/) | Raw signatures from Phase A | Platform ID, firmware version, protocol stack | Decoding the SENSE stage |
| **C** | [Tracking](/astra/docs/methodology/phase-c/) | Identified platform from Phase B | Continuous position track | Predicting the ACT stage |
| **D** | [Decision](/astra/docs/methodology/phase-d/) | Platform ID + behavior model from B/C | Selected countermeasure and attack chain | Modeling the DECIDE stage |
| **E** | [Engagement](/astra/docs/methodology/phase-e/) | Attack chain from Phase D + track from Phase C | Neutralized or redirected platform | Attacking SENSE, DECIDE, or ACT |
| **F** | [Exploitation](/astra/docs/methodology/phase-f/) | Captured/recovered platform from Phase E | Forensic intelligence, attribution data | Post-mortem of all stages |

## Relationship to Technique Categories

Phases describe **when**. Technique categories describe **what**.

A Phase E engagement might employ a **Mirage** technique (GPS spoofing) followed by an **Override** technique (MAVLink command injection). The phase is the operational stage. The technique category classifies the specific attack used within that stage.

## Reporting

ASTRA-structured reports follow the phase sequence. Each section of the report maps to a phase, with findings categorized by technique. This standardizes deliverables across engagements and enables cross-platform comparison of vulnerability profiles.

```
ASTRA Engagement Report
├── Phase A: Detection Results
│   └── RF emissions, radar cross-section, acoustic profile
├── Phase B: Identification Results
│   └── Platform ID, firmware version, protocol analysis
├── Phase C: Tracking Assessment
│   └── Effective tracking range, modality comparison
├── Phase D: Countermeasure Selection
│   └── Failsafe logic map, recommended attack chains
├── Phase E: Engagement Results
│   └── Technique execution, success/failure, conditions
└── Phase F: Exploitation/Forensics
    └── Firmware analysis, mission logs, attribution
```
