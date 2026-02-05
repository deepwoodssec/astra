---
layout: default
title: Techniques
nav_order: 3
has_children: true
permalink: /docs/techniques/
---

# ASTRA Technique Categories
{: .fs-8 }

Five categories. Four active, one persistent.
{: .fs-5 .fw-300 }

---

## Architecture

Four categories are **active** — they change the state of the target:

| Category | Target | Effect |
|:---------|:-------|:-------|
| [**Mirage**](/astra/docs/techniques/mirage/) | SENSE loop | Corrupt what the platform perceives |
| [**Fracture**](/astra/docs/techniques/fracture/) | DECIDE loop | Corrupt how the platform thinks |
| [**Override**](/astra/docs/techniques/override/) | ACT loop | Command what the platform does |
| [**Sever**](/astra/docs/techniques/sever/) | Loop continuity | Disrupt the platform's ability to sustain operations |

One category is **persistent** — it collects intelligence continuously without affecting the target:

| Category | Function | Scope |
|:---------|:---------|:------|
| [**Specter**](/astra/docs/techniques/specter/) | Continuous passive intelligence | Operates across all ASTRA phases, including during engagement |

---

## Why Specter is Not Just Reconnaissance

Phases A and B perform initial detection and identification — those are events in a timeline. Specter is a **persistent operational state**. It runs before, during, and after engagement. During Phase E, Specter monitors the target's response to countermeasures in real time. Between engagements, Specter maintains environmental awareness. Specter is the thread that never stops. The phases are events. Specter is the state.

---

## Category Selection

Phase D (Decision) selects technique categories based on the target's vulnerabilities and [hardening tier](/astra/docs/hardening-tiers/):

| If the target has... | Viable categories |
|:---------------------|:-----------------|
| Unauthenticated GPS | **Mirage** (GPS spoofing) |
| Unencrypted command channel | **Override** (command injection) |
| Known failsafe thresholds | **Fracture** (threshold manipulation) |
| Finite consumable resources | **Sever** (resource exhaustion) |
| Encrypted but active RF emissions | **Sever** (communication denial) |
| Active emissions of any kind | **Specter** (always viable) |

Categories chain. Mirage (GPS spoof triggers altitude failsafe) chains into Fracture (failsafe forces state transition) chains into Sever (forced VTOL motors drain battery). One engagement, three categories, one outcome: the platform lands where you want it.
