//
//  .swift
//  meta-optimized-reasoning-framework
//
//  Created by Ryan David Oates on 7/14/25.
//

# Reinitializing necessary variables due to state reset
from pathlib import Path
import zipfile

# Set up directory and files
base_path = Path("/mnt/data/hybrid_license_kit")
base_path.mkdir(parents=True, exist_ok=True)

# GitHub Actions YAML content
github_actions_yml = """name: Validate License Compliance

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  check-license:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repository
        uses: actions/checkout@v3

      - name: Search for license headers
        run: |
          echo "Checking for license compliance..."
          MISSING=$(grep -L "Copyright (C) Ryan Oates" $(find ./src -type f \\( -name '*.py' -o -name '*.js' -o -name '*.rs' -o -name '*.swift' -o -name '*.java' \\)))
          if [ -n "$MISSING" ]; then
            echo "The following files are missing license headers:" && echo "$MISSING"
            exit 1
          else
            echo "✅ All source files include license headers."
          fi

      - name: Verify README and LICENSE files exist
        run: |
          [ -f README.md ] && [ -f LICENSE_AGPL.txt ] && [ -f LICENSE_PPL.txt ] && echo "✅ Required top-level files are present." || (echo "❌ Missing README or license files." && exit 1)

      - name: Confirm authorship metadata
        run: |
          grep -q "Ryan Oates" README.md && echo "✅ Authorship metadata found in README." || (echo "❌ Author metadata missing." && exit 1)
"""

# File contents
files = {
    "LICENSE_AGPL.txt": "GNU AFFERO GENERAL PUBLIC LICENSE\nVersion 3, 19 November 2007\n\nCopyright (C) Ryan Oates, 2025\n...",
    "LICENSE_PPL.txt": "Peer Production License (PPL)\nVersion 1.0 — Adapted for Cognitive-Computational Frameworks\n\nAuthor: Ryan Oates...",
    "README.md": "# 🧠 Meta-Optimized Hybrid Reasoning Framework\n**by Ryan Oates**\n\n## ✨ Purpose\nThis framework is part of an interdisciplinary vision...",
    "CONTRIBUTING.md": "# Contribution Guidelines\n\nWelcome to the Meta-Optimized Hybrid Neuro-Symbolic Reasoning Framework.\n\n## Contributor Agreement...",
    "AUTHORS.md": "# Authors\n\n**Ryan Oates** — Creator and Epistemic Architect\nEmail: ryan_oates@my.cuesta.edu\n\n## Community Contributors\n[List verified contributors here]",
    "community_contributor_agreement.md": "# Community Contributor Agreement (CCA)\n**Version 1.0 | 2025 | Author: Ryan Oates**\n\n[... see full text above ...]",
    ".github/workflows/license-check.yml": github_actions_yml
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

