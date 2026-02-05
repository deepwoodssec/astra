---
layout: default
title: "Phase A — Detection"
parent: Methodology
nav_order: 1
permalink: /docs/methodology/phase-a/
---

# Phase A — Detection
{: .fs-8 }

Find the platform.
{: .fs-5 .fw-300 }

---

## Objective

Detect the presence of an autonomous platform within the operational area using passive sensor modalities. Phase A answers one question: **is something there?**

No identification. No classification. No engagement. Detection is the first awareness that an autonomous system is operating in your environment.

---

## Sensor Modalities

### RF Detection (Passive)

Autonomous platforms emit RF energy across predictable bands. Control links, telemetry downlinks, video transmitters, and inter-platform mesh radios all produce detectable emissions.

| Band | Common Use | Detection Method |
|:-----|:-----------|:----------------|
| 2.4 GHz | RC control links, WiFi-based control | SDR spectrum monitoring |
| 900 MHz | Long-range telemetry (SiK radios, LoRa) | SDR spectrum monitoring |
| 433 MHz | Telemetry, RC (region-dependent) | SDR spectrum monitoring |
| 5.8 GHz | Video downlink, DJI OcuSync | SDR spectrum monitoring |
| 1575.42 MHz | GPS L1 (receive only — platform does not transmit) | N/A for detection; relevant to Mirage |

RF detection is the highest-probability first-detection method for platforms maintaining active communication links. Platforms in fully autonomous mode with radios disabled present a harder problem — detectable only via radar or acoustic means.

### Acoustic Detection

Rotating propellers and motors produce broadband noise with characteristic spectral peaks at blade passage frequency and motor harmonics. Effective at ranges from tens of meters to several hundred meters depending on platform size, ambient noise, and wind.

Key measurements: blade passage frequency (BPF = blades × RPM / 60), motor harmonics, airframe resonance frequencies, spectral variation across flight modes (hover, cruise, transition).

A single microphone detects presence. An array (4+ per node) provides bearing via time-difference-of-arrival.

### Radar Detection

FMCW radar (77 GHz automotive-derived or purpose-built) detects aerial platforms via radar cross-section returns. Small UAS typically present RCS values between -20 dBsm and -5 dBsm depending on size, materials, and aspect angle.

Micro-Doppler signatures — modulation of the radar return caused by rotating blades — provide a detection indicator distinct from birds, debris, or other airborne clutter.

### Visual / Infrared

Optical and thermal imaging provide detection at ranges limited by sensor resolution and atmospheric conditions. Thermal contrast between motors/batteries and ambient air makes IR detection viable at night.

---

## Phase A Outputs

| Output | Format | Feeds |
|:-------|:-------|:------|
| RF emission detected (band, center frequency, signal strength) | IQ capture, spectrogram | Phase B |
| Acoustic detection (bearing, spectral profile) | WAV recording, frequency-domain plot | Phase B, Phase C |
| Radar detection (range, azimuth, RCS, micro-Doppler) | Radar data array | Phase B, Phase C |
| Detection timestamp and sensor node ID | Log entry | All subsequent phases |

---

## Relationship to Specter

Phase A is where Specter techniques are first employed. But Specter is not confined to Phase A — it runs continuously, providing updated intelligence even during engagement. Phase A is the first application. Specter is the persistent thread.

---

