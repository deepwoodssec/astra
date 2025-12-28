#!/bin/bash

# ASTRA Project Scaffold Script
# Run from the astra/ root directory

set -e

echo "Building ASTRA directory structure..."

# ====================
# Create directories
# ====================

# Docs
mkdir -p docs/{architecture,methodology,playbooks,whitepaper}

# Core (Python)
mkdir -p core/{src,tests}

# Specter (Python)
mkdir -p specter/{src,tests}

# Cinder (Go)
mkdir -p cinder/{cmd,pkg,internal}

# Ember (C/Rust)
mkdir -p ember/{src,include,tests}

# Acorn (Rust)
mkdir -p acorn/src

# Dagger (Python)
mkdir -p dagger/{src,templates,tests}

# Cloak (Go)
mkdir -p cloak/{cmd,pkg,internal}

# Sage (Python)
mkdir -p sage/{src,templates,tests}

# Hermes (Python)
mkdir -p hermes/{src,models,tests}

# Attack modules
mkdir -p modules/{mirage,fracture,override,sever}/{src,tests}

# Shared libraries
mkdir -p shared/{proto,crypto,comms}

# Scripts and tools
mkdir -p scripts
mkdir -p tools

# Integration tests
mkdir -p tests/integration

# Lab / learning space
mkdir -p lab/learning/{python,go,assembly,c}

# Vendor (third-party)
mkdir -p vendor

echo "Directories created."

# ====================
# Create .gitignore
# ====================

cat > .gitignore << 'EOF'
# Python
__pycache__/
*.py[cod]
*$py.class
*.so
.Python
venv/
env/
.env
*.egg-info/
dist/
build/

# Go
bin/
*.exe
*.exe~
*.dll
*.dylib

# Rust
target/
Cargo.lock

# C/C++
*.o
*.a
*.so
*.dylib
*.out

# IDE
.vscode/
.idea/
*.swp
*.swo
*~

# OS
.DS_Store
Thumbs.db

# Project specific
lab/learning/
*.log
*.tmp
EOF

echo ".gitignore created."

# ====================
# Create LICENSE (MIT)
# ====================

cat > LICENSE << 'EOF'
MIT License

Copyright (c) 2025 Sebastien Arseneault

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF

echo "LICENSE created."

# ====================
# Create root README
# ====================

cat > README.md << 'EOF'
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
EOF

echo "README.md created."

# ====================
# Module READMEs
# ====================

# Core
cat > core/README.md << 'EOF'
# Core

Mission brain. Orchestration, policy enforcement, logging, playbook execution.

**Language:** Python

**Status:** Not started
EOF

# Specter
cat > specter/README.md << 'EOF'
# Specter

Reconnaissance engine. Enumerates autonomous system attack surfaces.

**Language:** Python

**Phase:** 1 - Reconnaissance & Mapping

**Status:** Not started
EOF

# Cinder
cat > cinder/README.md << 'EOF'
# Cinder

C2 backend. Session management, tasking, secure comms.

**Language:** Go

**Status:** Not started
EOF

# Ember
cat > ember/README.md << 'EOF'
# Ember

Implant module. Lightweight beacon for target systems.

**Language:** C / Rust

**Status:** Not started
EOF

# Acorn
cat > acorn/README.md << 'EOF'
# Acorn

Payload builder. Builds Ember for multiple platforms and formats.

**Language:** Rust

**Status:** Not started
EOF

# Dagger
cat > dagger/README.md << 'EOF'
# Dagger

Delivery system. Initial access and payload deployment.

**Language:** Python

**Status:** Not started
EOF

# Cloak
cat > cloak/README.md << 'EOF'
# Cloak

OPSEC proxy. Infrastructure protection, TLS fingerprint manipulation.

**Language:** Go

**Status:** Not started
EOF

# Sage
cat > sage/README.md << 'EOF'
# Sage

Reporting engine. Transforms logs and evidence into deliverables.

**Language:** Python

**Status:** Not started
EOF

# Hermes
cat > hermes/README.md << 'EOF'
# Hermes

AI assistant. Offline advisor using local models. Advises, never decides.

**Language:** Python

**Status:** Not started
EOF

# Attack modules
cat > modules/mirage/README.md << 'EOF'
# Mirage

Perception attack module. Sensor spoofing, jamming, adversarial inputs.

**Phase:** 2 - Perception Attacks

**Status:** Not started
EOF

cat > modules/fracture/README.md << 'EOF'
# Fracture

Decision attack module. Logic fuzzing, threshold probing, model extraction.

**Phase:** 3 - Decision Attacks

**Status:** Not started
EOF

cat > modules/override/README.md << 'EOF'
# Override

Actuation attack module. Command injection, fail-safe manipulation.

**Phase:** 4 - Actuation Attacks

**Status:** Not started
EOF

cat > modules/sever/README.md << 'EOF'
# Sever

Loop disruption module. Timing attacks, C2 intercept, feedback corruption.

**Phase:** 5 - Loop Disruption

**Status:** Not started
EOF

echo "Module READMEs created."

# ====================
# Go module files
# ====================

cat > cinder/go.mod << 'EOF'
module github.com/sebastienarseneault/astra/cinder

go 1.21
EOF

cat > cloak/go.mod << 'EOF'
module github.com/sebastienarseneault/astra/cloak

go 1.21
EOF

echo "Go mod files created."

# ====================
# Rust cargo files
# ====================

cat > acorn/Cargo.toml << 'EOF'
[package]
name = "acorn"
version = "0.1.0"
edition = "2021"
description = "ASTRA payload builder"

[dependencies]
EOF

cat > ember/Cargo.toml << 'EOF'
[package]
name = "ember"
version = "0.1.0"
edition = "2021"
description = "ASTRA implant module"

[dependencies]
EOF

echo "Cargo.toml files created."

# ====================
# Python __init__.py
# ====================

touch core/src/__init__.py
touch specter/src/__init__.py
touch dagger/src/__init__.py
touch sage/src/__init__.py
touch hermes/src/__init__.py
touch modules/mirage/src/__init__.py
touch modules/fracture/src/__init__.py
touch modules/override/src/__init__.py
touch modules/sever/src/__init__.py

echo "Python __init__.py files created."

# ====================
# Done
# ====================

echo ""
echo "=========================================="
echo "ASTRA scaffold complete."
echo "=========================================="
echo ""
echo "Directory structure:"
find . -type d | head -40
echo "..."
echo ""
echo "Next steps:"
echo "  1. cd into astra/"
echo "  2. git init"
echo "  3. git add ."
echo "  4. git commit -m 'Initial scaffold'"
echo ""
echo "Start learning in: lab/learning/"
echo ""
