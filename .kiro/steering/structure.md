# Project Structure

## Root Directory Organization

```
├── .env                              # Environment configuration
├── .swift                           # Swift configuration file
├── AUTHORS.md                       # Author attribution and declarations
├── License-To-Add.xcodeproj/        # Xcode project files
├── License_To_Add/                  # Secondary project directory
├── core/                            # Core framework components
├── docs/                            # Documentation and research materials
├── licenses/                        # Legal documents and licensing
├── meta-optimized-reasoning-framework/ # Framework directory
├── src/                             # Source code implementation
├── workflows/                       # CI/CD and automation
└── xcode/                          # Additional Xcode resources
```

## Key Directories

### `/src/` - Source Code
- **MetaOptimizedFramework.swift**: Main framework implementation
- **NeuroSymbolicEngine.swift**: Neural-symbolic integration engine
- Primary Swift implementation files

### `/docs/` - Documentation
- **README.md**: Main project documentation and licensing info
- **CONTRIBUTING.md**: Contribution guidelines
- **FrameworkPreprint.swift**: Academic preprint materials
- **<cognitive_process>.md**: Cognitive process documentation
- Research and theoretical documentation

### `/licenses/` - Legal Framework
- **LICENSE_AGPL.txt**: GNU Affero General Public License v3
- **LICENSE_PPL.txt**: Peer Production License
- **community_contributor_agreement.md**: CCA for contributors

### `/core/` - Framework Architecture
- **FrameworkConfig.txt**: Configuration specifications
- **framework/**: Core framework components
- **neuro-symbolic/**: Neural-symbolic integration modules
- **reasoning/**: Reasoning system components

### `/.github/` - Development Workflow
- GitHub Actions and workflow configurations
- Issue templates and contribution guidelines

## File Naming Conventions
- Swift files: PascalCase (e.g., `MetaOptimizedFramework.swift`)
- Documentation: lowercase with hyphens or underscores
- Configuration files: lowercase with extensions

## Architecture Principles
- **Modular Design**: Separate concerns between symbolic, neural, and meta-optimization components
- **Academic Rigor**: Maintain clear separation between theoretical documentation and implementation
- **Ethical Boundaries**: Legal and licensing files prominently placed at root level
- **Cognitive Architecture**: Structure reflects the interdisciplinary nature of the framework

## Development Guidelines
- All Swift code should include proper attribution headers
- Maintain separation between core framework (`/core/`) and implementation (`/src/`)
- Documentation should reference academic sources and theoretical foundations
- Respect the dual licensing model in all file headers and comments