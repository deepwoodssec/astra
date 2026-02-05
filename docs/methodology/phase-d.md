---
layout: default
title: "Phase D — Decision"
parent: Methodology
nav_order: 4
permalink: /docs/methodology/phase-d/
---

# Phase D — Decision
{: .fs-8 }

Select the countermeasure.
{: .fs-5 .fw-300 }

---

## Objective

Given a positively identified platform (Phase B) with known vulnerabilities (Phase F pre-engagement intelligence), select the optimal countermeasure or countermeasure chain. Phase D is the bridge between intelligence and action.

Phase D does not execute anything. It produces a ranked decision: given what we know about this target, what is the highest-probability method to achieve the desired effect?

---

## Decision Inputs

| Input | Source |
|:------|:-------|
| Platform identification | Phase B |
| Tracking data quality | Phase C |
| Failsafe decision tree | Phase F (pre-engagement) / database |
| Exploit chain library | Database |
| Adversary hardening tier | Phase B + Phase F assessment |
| Environmental conditions | Operational context |

---

## The Failsafe Decision Tree

The core of Phase D for most autonomous platforms. Every failsafe is a **guaranteed state transition** that you can trigger on purpose.

The decision tree inverts the designer's intent: safety mechanisms become attack surfaces.

```
IF target has GPS dependency AND GPS is not authenticated:
    → GPS spoofing viable (Mirage techniques)
    
IF target command channel is unencrypted AND unsigned:
    → Command injection viable (Override techniques)

IF target decision thresholds are known AND triggerable:
    → Threshold manipulation viable (Fracture techniques)

IF target has finite consumable resources with known depletion rates:
    → Resource exhaustion viable (Sever techniques)
```

---

## Countermeasure Ranking

Phase D ranks viable countermeasures by:

1. **Success probability** — tested success rate from the database
2. **Time to effect** — initiation to platform state change
3. **Operational constraints** — legal, environmental, equipment
4. **Reversibility** — can the effect be undone if engagement is called off
5. **Detection risk** — does the countermeasure reveal capability

---

## Hardening Tier Filtering

The target's [hardening tier](/astra/docs/hardening-tiers/) filters technique categories before ranking:

| Tier | Viable Categories | Filtered Out |
|:-----|:-----------------|:-------------|
| 0 (COTS unmodified) | All | None |
| 1 (Protocol-hardened) | Specter, Mirage, Fracture, Sever | Override (requires bypass) |
| 2 (Sensor-hardened) | Specter, Fracture, Sever | Override, Mirage (requires defeat of authentication) |
| 3 (Full-stack hardened) | Specter | All active categories require novel research |

Phase D must be honest. If no viable countermeasure exists at the assessed hardening tier, the output is "no viable countermeasure with current capability" — not a low-probability guess.

---

## Human Authorization

Phase D produces recommendations. Phase E requires human authorization before execution. The decision engine does not fire autonomously. An operator reviews the ranked list, confirms the engagement, and authorizes execution.

This is a design constraint, not a technical limitation.

---

## Phase D Outputs

| Output | Format | Feeds |
|:-------|:-------|:------|
| Ranked countermeasure list | Ordered exploit chain references | Phase E execution |
| Per-countermeasure success estimate | Probability | Phase E go/no-go |
| Required equipment and parameters | Configuration data | Phase E setup |
| Engagement feasibility | Go / conditional / no-go | Operator decision |
