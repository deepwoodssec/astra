---
layout: default
title: "Mirage"
parent: Techniques
nav_order: 2
permalink: /docs/techniques/mirage/
---

# Mirage — SENSE Loop Corruption
{: .fs-8 }

Corrupt what the platform perceives.
{: .fs-5 .fw-300 }

---

## Classification

| Attribute | Value |
|:----------|:------|
| **Type** | Active — alters target state |
| **Target** | SENSE loop |
| **Effect** | Platform acts on false perception of its environment |
| **Phases** | Primarily Phase E (Engagement) |
| **Hardening Viability** | Tier 0-1: high. Tier 2: requires defeat of sensor hardening. Tier 3: requires novel research |

---

## Definition

Mirage techniques corrupt the target's perception of its environment. The DECIDE and ACT loops continue functioning correctly — they operate on false inputs. The platform does what its logic tells it to do, but its logic is working with attacker-controlled data.

The distinction from Override: Override commands the platform directly. Mirage makes the platform command itself.

---

## Primary Technique: GPS Spoofing

Civil GNSS signals (GPS L1 at 1575.42 MHz, GLONASS, BeiDou, Galileo) are unencrypted and unauthenticated. A spoofed signal that arrives at the receiver with sufficient power and plausible characteristics is accepted as legitimate.

### Spoofing Modes

| Mode | Effect |
|:-----|:-------|
| **Position shift** | Gradually drift perceived position — redirect flight path |
| **Altitude manipulation** | Spoof altitude to trigger altitude-dependent failsafes |
| **Velocity manipulation** | Spoof ground speed to corrupt airspeed failover logic |
| **Time manipulation** | Disrupt time-dependent functions |
| **Denial via noise** | Overwhelm receiver — trigger GPS-loss failsafe |

### Key Parameters

| Parameter | Significance |
|:----------|:------------|
| Signal power relative to legitimate | Must overpower real satellites. Too much power is detectable |
| Position ramp rate | Gradual shift avoids sudden-jump detection |
| Constellation geometry | Must present plausible HDOP/VDOP |
| Multi-constellation coherence | If receiver tracks GPS + GLONASS, both must be spoofed |

---

## Secondary Techniques

### Camera/LIDAR Blinding

High-intensity light (visible or IR) at optical sensors. Degrades visual navigation and ISR capability.

### Adversarial Patches

ML-based visual navigation and object detection corrupted by adversarial patterns placed in the environment.

### Magnetometer Spoofing

Strong localized magnetic fields corrupt compass readings, causing heading errors during GPS-denied operation.

---

## Mirage vs. Hardening

| Hardening | Impact on Mirage |
|:----------|:----------------|
| GPS authentication (Galileo OSNMA, M-code) | Defeats basic spoofing |
| Multi-constellation cross-check | Increases complexity — must spoof all constellations |
| GPS/INS fusion | Gradual spoofing may work; sudden shifts detected by IMU |
| Multi-sensor fusion (GPS + vision + LIDAR) | Requires multi-modal spoofing |
| Anti-spoofing firmware (jump detection) | Requires gradual ramp, power matching |

Mirage is not eliminated until all sensor modalities are authenticated and cross-checked.
