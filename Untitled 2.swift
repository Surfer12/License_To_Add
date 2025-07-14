from pathlib import Path
import zipfile

# Set up directory and files
base_path = Path("/mnt/data/hybrid_license_kit")
base_path.mkdir(parents=True, exist_ok=True)

# File contents
files = {
    "LICENSE_AGPL.txt": """GNU AFFERO GENERAL PUBLIC LICENSE
Version 3, 19 November 2007

Copyright (C) Ryan Oates, 2025
Author of the Meta-Optimized Hybrid Neuro-Symbolic Reasoning Framework

[... standard AGPL license text should be inserted here ...]
""",
    "LICENSE_PPL.txt": """Peer Production License (PPL)
Version 1.0 — Adapted for Cognitive-Computational Frameworks

Author: Ryan Oates
Year: 2025
Project: Meta-Optimized Hybrid Neuro-Symbolic Reasoning Framework

[... see full text above ...]
""",
    "README.md": """# 🧠 Meta-Optimized Hybrid Reasoning Framework
**by Ryan Oates**

## ✨ Purpose
This framework is part of an interdisciplinary vision...

[... see full README content above ...]
""",
    "CONTRIBUTING.md": """# Contribution Guidelines

Welcome to the Meta-Optimized Hybrid Neuro-Symbolic Reasoning Framework.

## Contributor Agreement

Please review and sign the Community Contributor Agreement...

[... continued ...]
""",
    "AUTHORS.md": """# Authors

**Ryan Oates** — Creator and Epistemic Architect
Email: ryan_oates@my.cuesta.edu

## Community Contributors

[List verified contributors here]
""",
    "community_contributor_agreement.md": """# Community Contributor Agreement (CCA)
**Version 1.0 | 2025 | Author: Ryan Oates**

[... see full text above ...]
""",
    ".github/workflows/license-check.yml": (
        "# GitHub Actions Workflow for License Compliance\n"
        + open("/mnt/data/canmore/textdoc_687548470264819194f08dcda45a6783.yaml").read()
    )
}

# Write all files
for filename, content in files.items():
    file_path = base_path / filename
    file_path.parent.mkdir(parents=True, exist_ok=True)
    with open(file_path, "w") as f:
        f.write(content)

# Create ZIP archive
zip_path = Path("/mnt/data/hybrid_license_kit.zip")
with zipfile.ZipFile(zip_path, "w") as zipf:
    for file in base_path.rglob("*"):
        zipf.write(file, file.relative_to(base_path.parent))

zip_path.name
