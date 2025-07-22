# RecursiveBlogUI

A sophisticated SwiftUI-based blog application that demonstrates recursive/agent-based content filtering and user interaction patterns. The app features an adaptive persona agent that evolves based on user interactions and content complexity, creating a dynamic and personalized reading experience.

## Features

### 🧠 Adaptive Agent System
- **PersonaAgent**: An intelligent agent that tracks user interactions and evolves over time
- **Evolution Stages**: Novice → Explorer → Scholar → Sage → Master
- **Curiosity Types**: Theory, Demo, Application
- **Domain Focus**: Academic, Industry, Interdisciplinary

### 📚 Smart Content Filtering
- **Agent-Based Filtering**: Content adapts based on agent's current state
- **Complexity Matching**: Posts are filtered by complexity level relative to agent depth
- **Search Functionality**: Full-text search across titles, authors, and tags
- **Real-time Updates**: Filtering updates as agent evolves

### 🎯 Interactive User Experience
- **User Controls**: Direct interaction with agent through curiosity type buttons
- **Evolution History**: Complete timeline of agent evolution events
- **Visual Indicators**: Complexity indicators and agent status display
- **Contact Prompts**: Intelligent suggestions for deeper collaboration

### 📊 Rich Content Metadata
- **Stable IDs**: Consistent post identification across sessions
- **Domain Classification**: Posts tagged with academic/industry/interdisciplinary focus
- **Curiosity Alignment**: Content matched to theory/demo/application preferences
- **Complexity Levels**: Numerical complexity scoring (1-10)

## Architecture

### MVVM Pattern
```
Models/
├── BlogPost.swift          # Content data model with filtering properties
└── PersonaAgent.swift      # Adaptive agent with evolution tracking

ViewModels/
└── BlogViewModel.swift     # Business logic, filtering, agent management

Views/
├── BlogListView.swift      # Main list with search and filtering
├── BlogDetailView.swift    # Individual post display
└── TraceBlockView.swift    # Agent interaction and history

Utilities/
└── BlogPostYAMLLoader.swift # YAML parsing with error handling
```

### Key Components

#### PersonaAgent
- Tracks recursion depth and evolution history
- Adapts curiosity type based on interaction patterns
- Provides computed properties for UI display
- Supports user-driven evolution and reset functionality

#### BlogViewModel
- Manages blog post loading and filtering
- Handles agent evolution and user interactions
- Provides search and agent-based filtering
- Maintains state consistency across views

#### TraceBlockView
- Displays current agent status and evolution stage
- Provides interactive controls for user-agent interaction
- Shows evolution history in a modal sheet
- Displays contact prompts for advanced users

## Data Schema

### BlogPost YAML Structure
```yaml
- id: "unique-stable-id"
  title: "Post Title"
  slug: "url-slug"
  author: "Author Name"
  tags: ["tag1", "tag2"]
  audience: ["researchers", "developers"]
  published_at: "2024-01-15"
  reading_time: 12
  complexity_level: 8
  invites: ["discussion", "collaboration"]
  linked_demos: ["https://example.com/demo"]
  domain_focus: "academic"      # academic, industry, interdisciplinary
  curiosity_type: "theory"      # theory, demo, application
```

### Agent Evolution Events
```swift
struct EvolutionEvent {
    let timestamp: Date
    let trigger: String
    let oldDepth: Int
    let newDepth: Int
    let oldCuriosity: CuriosityType
    let newCuriosity: CuriosityType?
}
```

## Usage

### Basic Navigation
1. **Browse Posts**: View all posts in the main list
2. **Search**: Use the search bar to find specific content
3. **Agent Filtering**: Toggle agent-based filtering to see personalized content
4. **View Details**: Tap any post to see full details and interact with the agent

### Agent Interaction
1. **Curiosity Controls**: Use Theory/Demo/Application buttons to guide agent evolution
2. **History View**: Tap the clock icon to see agent evolution history
3. **Reset Agent**: Use the reset button to start fresh
4. **Contact Prompts**: Advanced users will see collaboration suggestions

### Content Discovery
- **Complexity Indicators**: Visual dots show post complexity relative to agent level
- **Tag System**: Browse posts by topic tags
- **Domain Matching**: Content automatically aligns with agent's domain focus
- **Reading Time**: Estimated reading duration for each post

## Development

### Prerequisites
- Xcode 14.0+
- iOS 16.0+
- Swift 5.7+

### Dependencies
- **Yams**: YAML parsing library
- **SwiftUI**: UI framework
- **Combine**: Reactive programming

### Testing
Run the comprehensive test suite:
```bash
xcodebuild test -scheme RecursiveBlogUI -destination 'platform=iOS Simulator,name=iPhone 14'
```

### Key Test Areas
- Agent evolution and user interaction
- Search and filtering functionality
- YAML loading and error handling
- View model state management

## Recursive Patterns

The app demonstrates several recursive patterns:

1. **Agent Evolution**: User interactions → Agent evolution → Content filtering → New interactions
2. **Complexity Matching**: Agent depth influences content visibility, which affects future depth
3. **Curiosity Adaptation**: Content preferences shape agent behavior, which shapes future preferences
4. **History Tracking**: Evolution events create a recursive timeline of system behavior

## Future Enhancements

- **Persistent Agent State**: Save agent evolution across app sessions
- **Advanced Analytics**: Track reading patterns and agent effectiveness
- **Collaborative Features**: Multi-agent interactions and shared evolution
- **Content Generation**: AI-powered content recommendations based on agent state
- **Visualization**: Charts and graphs showing agent evolution patterns

## Contributing

We welcome contributions from the community! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for detailed guidelines, including our Community Contributor Agreement and ethical framework.

### Quick Start
1. Fork the repository
2. Create a feature branch
3. Implement changes with tests
4. Submit a pull request

### Areas of Interest
- Agent evolution algorithms
- Content filtering improvements
- UI/UX enhancements
- Performance optimization
- Accessibility features

## Licensing

RecursiveBlogUI uses a dual-license system designed to support both open-source collaboration and ethical commercial use:

- **GNU Affero General Public License v3 (AGPLv3)**: For public deployments and derivative works
- **Peer Production License (PPL) v1.0**: For ethical, commons-oriented use

See [LICENSE.md](LICENSE.md) for complete licensing information and usage guidelines.

### Commercial Use
For commercial licensing inquiries, contact: ryan_oates@my.cuesta.edu

## Authors and Attribution

- **Primary Author**: Ryan Oates (Cuesta College)
- **Research Context**: Meta-Optimization in Hybrid Theorem Proving Framework

See [AUTHORS.md](AUTHORS.md) for complete contributor information and citation guidelines. 