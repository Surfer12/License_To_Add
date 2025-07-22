# Licensing Guide for RecursiveBlogUI

## Overview

This guide explains how to properly apply licensing information to different types of files in the RecursiveBlogUI project. Consistent licensing application ensures compliance and proper attribution.

## File Types and License Application

### Swift Source Files (.swift)

**Header Format**: Use the full license header for core framework files, simplified header for utility files.

#### Core Framework Files
```swift
/*
 * RecursiveBlogUI
 * 
 * Copyright (C) Ryan Oates, 2025
 * 
 * This file is part of RecursiveBlogUI, an adaptive agent-based content filtering framework.
 * 
 * RecursiveBlogUI is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * RecursiveBlogUI is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 * 
 * You should have received a copy of the GNU Affero General Public License
 * along with RecursiveBlogUI.  If not, see <https://www.gnu.org/licenses/>.
 * 
 * For commercial licensing inquiries, contact: ryan_oates@my.cuesta.edu
 * 
 * Research Context: Meta-Optimization in Hybrid Theorem Proving: Cognitive-Constrained Reasoning Framework
 * 
 * This file implements [brief description of the file's purpose]
 */
```

#### Utility and Test Files
```swift
/*
 * RecursiveBlogUI - [File Name]
 * 
 * Copyright (C) Ryan Oates, 2025
 * 
 * This file is part of RecursiveBlogUI.
 * 
 * Licensed under the GNU Affero General Public License v3
 * See LICENSE.md for complete licensing information
 * 
 * For commercial use, contact: ryan_oates@my.cuesta.edu
 */
```

### Documentation Files (.md, .txt)

**Header Format**: Use a simplified header with clear attribution.

```markdown
# [Document Title]

**Copyright (C) Ryan Oates, 2025**

This document is part of RecursiveBlogUI and is licensed under the GNU Affero General Public License v3.

For commercial licensing inquiries, contact: ryan_oates@my.cuesta.edu

---

[Document content begins here]
```

### Configuration Files (.yaml, .json, .plist)

**Header Format**: Use comment-based headers appropriate to the file format.

#### YAML Files
```yaml
# RecursiveBlogUI Configuration
# Copyright (C) Ryan Oates, 2025
# Licensed under GNU Affero General Public License v3
# For commercial use, contact: ryan_oates@my.cuesta.edu

# Configuration content begins here
```

#### JSON Files
```json
{
  "_license": "GNU Affero General Public License v3",
  "_copyright": "Copyright (C) Ryan Oates, 2025",
  "_contact": "ryan_oates@my.cuesta.edu",
  "content": "Configuration data begins here"
}
```

### Asset Files (.xcassets, images, etc.)

**Metadata**: Include licensing information in asset metadata or accompanying documentation.

```json
{
  "info": {
    "author": "Ryan Oates",
    "version": 1,
    "license": "GNU Affero General Public License v3",
    "contact": "ryan_oates@my.cuesta.edu"
  }
}
```

## License Application Guidelines

### When to Use Full Headers
- Core framework implementation files
- Public API files
- Files that may be distributed independently
- Files with significant intellectual property

### When to Use Simplified Headers
- Test files
- Utility scripts
- Documentation files
- Configuration files
- Asset files

### Attribution Requirements
All files must include:
1. Copyright notice: "Copyright (C) Ryan Oates, 2025"
2. License reference: "GNU Affero General Public License v3"
3. Contact information: "ryan_oates@my.cuesta.edu"

### Special Cases

#### Third-Party Dependencies
- Clearly mark third-party code
- Include original license information
- Ensure compatibility with project license

#### Generated Files
- Include license information in generation templates
- Ensure generated code includes appropriate headers

#### Documentation Derived from Code
- Include source file references
- Maintain consistent attribution

## Compliance Checklist

### Before Committing
- [ ] All new files have appropriate license headers
- [ ] Modified files retain license information
- [ ] Third-party code is properly attributed
- [ ] License information is accurate and complete

### Before Release
- [ ] All files reviewed for license compliance
- [ ] LICENSE.md is up to date
- [ ] AUTHORS.md includes all contributors
- [ ] CONTRIBUTING.md reflects current practices

## Tools and Automation

### Xcode Templates
- Create file templates with license headers
- Configure project templates for new files
- Use build phases to verify license compliance

### Scripts
- License header validation scripts
- Automated header insertion for new files
- Compliance checking in CI/CD pipeline

### IDE Integration
- Configure code snippets for license headers
- Set up file templates in Xcode
- Use linting tools to check compliance

## Common Issues and Solutions

### Missing Headers
**Issue**: Files without license headers
**Solution**: Add appropriate headers and update documentation

### Inconsistent Formatting
**Issue**: Different header formats across files
**Solution**: Standardize on approved templates

### Third-Party Attribution
**Issue**: Unclear attribution for third-party code
**Solution**: Add clear markers and original license information

### Commercial Use Inquiries
**Issue**: Users unsure about commercial licensing
**Solution**: Provide clear contact information and licensing options

## Resources

- [LICENSE.md](../LICENSE.md) - Complete licensing information
- [CONTRIBUTING.md](../CONTRIBUTING.md) - Contribution guidelines
- [AUTHORS.md](../AUTHORS.md) - Attribution information
- [LicenseHeader.swift](LicenseHeader.swift) - Header templates

## Questions?

For questions about licensing application or compliance:
1. Check existing documentation
2. Review similar files in the project
3. Contact ryan_oates@my.cuesta.edu

---

*This guide ensures consistent and compliant licensing across the RecursiveBlogUI project.* 