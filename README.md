# ASTRA Framework

**Autonomous System Targeting, Reconnaissance & Attack**

A six-phase counter-autonomy red team methodology for attacking unmanned and autonomous systems.

📖 **Documentation:** [deepwoodssec.github.io/astra](https://deepwoodssec.github.io/astra)

---

## Overview

ASTRA is a structured methodology for offensive security assessments against autonomous systems. Every autonomous system operates on a **SENSE → DECIDE → ACT** loop. ASTRA provides systematic approaches to attacking each stage of that loop.

ASTRA is to counter-autonomy what MITRE ATT&CK is to enterprise security.

## Phases

| Phase | Name | Function |
|-------|------|----------|
| A | Detection | Discover and characterize target emissions |
| B | Identification | Identify platform type, firmware, protocols |
| C | Tracking | Maintain positional awareness of target |
| D | Decision | Map failsafe logic, select countermeasure |
| E | Engagement | Execute attack chain |
| F | Exploitation | Extract forensic intelligence |

## Technique Categories

| Category | Target | Description |
|----------|--------|-------------|
| Specter | SENSE | Passive reconnaissance and platform fingerprinting |
| Mirage | SENSE | Active sensor deception (GPS spoofing, sensor blinding) |
| Fracture | DECIDE | Decision logic corruption (failsafe manipulation, swarm poisoning) |
| Override | ACT | Direct command injection (flight controller exploitation) |
| Sever | Loop | Timing disruption (desynchronization, latency injection) |

## Maintained By

[Deep Woods Security](https://deepwoodssecurity.com) — Counter-UAS Offensive Cybersecurity

## License

MIT License. See [LICENSE](LICENSE) for details.
