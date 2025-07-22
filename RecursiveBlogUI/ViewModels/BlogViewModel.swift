import Foundation
import Combine

class BlogViewModel: ObservableObject {
    @Published var posts: [BlogPost] = []
    @Published var agent: PersonaAgent
    @Published var errorMessage: String? = nil
    @Published var searchText: String = ""
    @Published var showOnlyMatchingAgent: Bool = false
    
    private var allPosts: [BlogPost] = []
    
    init() {
        self.agent = PersonaAgent(domain: .academic, curiosity: .theory)
        loadPosts()
    }
    
    func loadPosts() {
        let result = BlogPostYAMLLoader.loadBlogPosts()
        switch result {
        case .success(let loadedPosts):
            self.allPosts = loadedPosts
            self.posts = loadedPosts
        case .failure(let error):
            self.errorMessage = error.localizedDescription
        }
    }
    
    func filteredPosts() -> [BlogPost] {
        var filtered = allPosts
        
        // Apply search filter
        if !searchText.isEmpty {
            filtered = filtered.filter { post in
                post.title.localizedCaseInsensitiveContains(searchText) ||
                post.author.localizedCaseInsensitiveContains(searchText) ||
                post.tags.contains { $0.localizedCaseInsensitiveContains(searchText) }
            }
        }
        
        // Apply agent-based filtering
        if showOnlyMatchingAgent {
            filtered = filtered.filter { post in
                // Match domain focus
                let domainMatches = post.domainFocus == nil || post.domainFocus == agent.domain
                
                // Match curiosity type
                let curiosityMatches = post.curiosityType == nil || post.curiosityType == agent.curiosity
                
                // Match complexity level (posts within agent's current range)
                let complexityMatches = post.complexity_level <= agent.recursionDepth + 2
                
                return domainMatches && curiosityMatches && complexityMatches
            }
        }
        
        return filtered
    }
    
    func evolveAgent(with post: BlogPost) {
        agent.evolve(basedOn: post.complexity_level)
    }
    
    func userInteraction(type: PersonaAgent.CuriosityType) {
        agent.userInteraction(type: type)
    }
    
    func resetAgent() {
        agent.reset()
    }
    
    func toggleAgentFiltering() {
        showOnlyMatchingAgent.toggle()
    }
    
    // Computed properties for UI
    var matchingPostCount: Int {
        return filteredPosts().count
    }
    
    var totalPostCount: Int {
        return allPosts.count
    }
    
    var agentStatus: String {
        return "\(agent.evolutionStage) (\(agent.recursionDepth) depth)"
    }
} 