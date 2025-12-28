# ASTRA

**Adversarial System Testing, Reconnaissance, and Access**

Open-source counter-autonomy red team framework.

## What It Is

ASTRA tests autonomous systems by breaking the SENSE → DECIDE → ACT loop before adversaries do.

## Architecture

| Module | Language | Purpose |
|--------|----------|---------|
| Core | Python | Mission orchestration, policy, logging, playbooks |
| Specter | Python | Reconnaissance engine |
| Cinder | Go | C2 backend |
| Ember | C/Rust | Implant |
| Acorn | Rust | Payload builder |
| Dagger | Python | Delivery system |
| Cloak | Go | OPSEC proxy |
| Sage | Python | Reporting engine |
| Hermes | Python | AI assistant |

### Attack Modules

| Module | Phase | Target |
|--------|-------|--------|
| Mirage | 2 | Perception attacks |
| Fracture | 3 | Decision attacks |
| Override | 4 | Actuation attacks |
| Sever | 5 | Loop disruption |

## Principles

- Methodology-first
- Operator control
- Open source
- Craftsman's apprenticeship, not consumer spoon-feeding

## Status

In development.

## License

MIT
