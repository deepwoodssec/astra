---
layout: default
title: Adversary Hardening Tiers
nav_order: 4
permalink: /docs/hardening-tiers/
---

# Adversary Hardening Tiers
{: .fs-8 }

The arms race has structure. Map it.
{: .fs-5 .fw-300 }

---

## Purpose

ASTRA techniques do not apply uniformly. A $200 toy drone and a military UAS with encrypted links and GPS authentication present fundamentally different attack surfaces. Hardening tiers map target sophistication to technique viability.

Assessed during Phase B (Identification) and Phase F (pre-engagement intelligence). Feeds Phase D (Decision), filtering technique categories to only those viable against the assessed level.

---

## Tier 0 — COTS Unmodified

Factory-default configuration. No security hardening applied.

| Characteristic | Typical |
|:--------------|:--------|
| Command protocol | MAVLink v1/v2, unsigned, unencrypted |
| GPS | Civil L1, no authentication |
| Firmware | Factory version, publicly documented |
| Telemetry | Unencrypted, broadcast in the clear |
| Failsafe logic | Published, deterministic, exploitable |

**Viable categories:** All five. Full ASTRA toolkit applies.

**Prevalence:** The majority of commercially available platforms, including Chinese COTS drones used for ISR. This is the current baseline threat.

---

## Tier 1 — Protocol-Hardened

Communication protocols secured. Command authentication and/or encryption enabled. Everything else remains Tier 0.

| Characteristic | Typical |
|:--------------|:--------|
| Command protocol | MAVLink v2 with signing, or encrypted proprietary |
| GPS | Civil L1, no authentication (unchanged) |
| Telemetry | Encrypted or signed |

**Viable categories:**

| Category | Status |
|:---------|:-------|
| Specter | ✓ Encrypted traffic still detectable via RF fingerprinting |
| Mirage | ✓ GPS spoofing unaffected by protocol hardening |
| Fracture | ✓ Decision logic unaffected |
| Override | ✗ Requires defeating signing/encryption |
| Sever | ✓ Resource exhaustion and comms denial unaffected |

Protocol hardening defeats Override but leaves everything else intact. A Tier 1 target is marginally harder than Tier 0.

---

## Tier 2 — Sensor-Hardened

Sensor inputs hardened. GPS authentication, multi-sensor fusion, anti-spoofing firmware, or redundant navigation. Protocol hardening also present.

| Characteristic | Typical |
|:--------------|:--------|
| Command protocol | Encrypted and authenticated |
| GPS | Multi-constellation with authentication, or GPS-denied navigation |
| Firmware | Hardened, anti-tamper protections may be present |
| Navigation | Multi-modal (GPS + visual + LIDAR + INS) |

**Viable categories:**

| Category | Status |
|:---------|:-------|
| Specter | ✓ Detection works; classification harder |
| Mirage | ⚠ GPS spoofing defeated by authentication. Multi-modal requires multi-sensor spoofing |
| Fracture | ⚠ Harder with adaptive logic but decision complexity creates new attack surface |
| Override | ✗ Protocol hardening defeats injection |
| Sever | ✓ Physics-based attacks unaffected |

Significant step up. Fracture and Sever become primary viable active categories.

---

## Tier 3 — Full-Stack Hardened

Every layer hardened. Military-grade or purpose-built.

| Characteristic | Typical |
|:--------------|:--------|
| Command protocol | Military encryption, hardware security modules |
| GPS | Military M-code or GPS-denied capable |
| Firmware | Signed, encrypted, anti-tamper, secure boot |
| Telemetry | LPI waveforms |
| Failsafe logic | Adaptive, non-deterministic |
| Physical | Anti-tamper enclosures, potted electronics |

**Viable categories:**

| Category | Status |
|:---------|:-------|
| Specter | ⚠ RF detection viable but classification severely limited |
| Mirage | ✗ Without novel research |
| Fracture | ⚠ Requires novel research |
| Override | ✗ Cryptographic protection defeats known techniques |
| Sever | ⚠ Resource exhaustion works (physics). Anti-jam degrades comms denial |

Phase D must honestly report "no viable countermeasure with current capability" when this is the assessment.

---

## Assessment Flow

```
1. Is the command channel encrypted or signed?
     No  → Tier 0
     Yes → Continue

2. Is GPS authenticated or navigation multi-modal?
     No  → Tier 1
     Yes → Continue

3. Anti-tamper, secure boot, LPI comms, adaptive decision logic?
     No  → Tier 2
     Yes → Tier 3
```

Real-world platforms may be mixed (Tier 1 comms, Tier 0 GPS). Phase D evaluates viability per attack vector, not per overall tier.

---

## The Trajectory

The threat landscape is Tier 0 today. GPS authentication is deploying. Protocol signing is becoming standard. Multi-sensor navigation is commoditizing. The trajectory moves toward Tier 2 over the next 5-10 years.

ASTRA is designed for this. Fracture and Sever — the categories that survive hardening — exploit decision logic complexity and physical constraints that cannot be patched. Building expertise in these now creates capability that remains viable as the adversary hardens.

---

