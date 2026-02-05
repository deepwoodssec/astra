---
layout: default
title: "Phase C — Tracking"
parent: Methodology
nav_order: 3
permalink: /docs/methodology/phase-c/
---

# Phase C — Tracking
{: .fs-8 }

Follow the platform.
{: .fs-5 .fw-300 }

---

## Objective

Maintain continuous position awareness of the identified platform. Phase C provides the targeting data that Phase E requires — you cannot direct a countermeasure at a platform you cannot follow.

---

## Tracking Methods

### Telemetry-Derived Tracking

If the platform's telemetry link is unencrypted and passively receivable, the MAVLink GLOBAL_POSITION_INT message (message ID 33) broadcasts the platform's own GPS-derived position at 1-10 Hz — latitude, longitude, altitude, ground speed, and heading.

The target is broadcasting its own position. Passive reception provides accurate tracking without any active emission by the defender.

Fails against: encrypted telemetry, disabled telemetry radios, or targets beyond reception range.

### RF Direction-Finding

The telemetry radio and RC link are continuous RF emitters. Directional antennas or arrays on multiple sensor nodes provide bearing estimates via RSSI comparison, time-difference-of-arrival (TDOA), or angle-of-arrival (AoA).

Two bearings provide a 2D fix. Three or more provide a 3D fix with error estimation.

### Acoustic Triangulation

MEMS microphone arrays (4+ elements per node) provide azimuth estimates via TDOA. Multiple nodes provide position fixes. Effective at shorter ranges than RF (typically under 500m for small UAS) but works against RF-silent platforms.

### Radar Tracking

FMCW radar provides range, azimuth, and altitude at 10-20 Hz update rates. Independent of target emissions — works against fully RF-silent platforms.

---

## Multi-Modal Fusion

No single method is reliable across all conditions.

| Method | Range | Works RF-Silent | Update Rate | Accuracy |
|:-------|:------|:---------------|:------------|:---------|
| Telemetry-derived | Radio range | No | 1-10 Hz | High (GPS-accurate) |
| RF direction-finding | Radio range | No | 1-10 Hz | Moderate |
| Acoustic | < 500m | Yes | 10-50 Hz | Low-moderate |
| Radar | Radar-dependent | Yes | 10-20 Hz | Moderate-high |

A Kalman filter or equivalent tracker fuses these inputs, weighting by confidence and recency. The fused track feeds Phase E targeting.

---

## Phase C Outputs

| Output | Format | Feeds |
|:-------|:-------|:------|
| Platform position (lat, lon, alt) | Time-stamped coordinate | Phase E targeting |
| Platform velocity and heading | Vector | Phase E lead computation |
| Track quality / confidence | Metric | Phase D engagement feasibility |
| Tracking method(s) active | Status flags | Phase D method selection |

---

