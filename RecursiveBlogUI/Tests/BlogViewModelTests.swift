import XCTest
@testable import RecursiveBlogUI

class BlogViewModelTests: XCTestCase {
    var viewModel: BlogViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = BlogViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testInitialState() {
        XCTAssertEqual(viewModel.posts.count, 0)
        XCTAssertEqual(viewModel.agent.domain, .academic)
        XCTAssertEqual(viewModel.agent.curiosity, .theory)
        XCTAssertEqual(viewModel.agent.recursionDepth, 0)
        XCTAssertFalse(viewModel.agent.invitesContact)
    }
    
    func testAgentEvolution() {
        let initialDepth = viewModel.agent.recursionDepth
        viewModel.agent.evolve(basedOn: 5)
        
        XCTAssertEqual(viewModel.agent.recursionDepth, initialDepth + 5)
        XCTAssertEqual(viewModel.agent.curiosity, .theory) // Should change to theory when trace > 5
    }
    
    func testAgentUserInteraction() {
        let initialCuriosity = viewModel.agent.curiosity
        viewModel.agent.userInteraction(type: .demo)
        
        XCTAssertEqual(viewModel.agent.curiosity, .demo)
        XCTAssertEqual(viewModel.agent.recursionDepth, 1) // Should increment by 1
        XCTAssertTrue(viewModel.agent.evolutionHistory.count > 0)
    }
    
    func testAgentReset() {
        viewModel.agent.evolve(basedOn: 10)
        viewModel.agent.userInteraction(type: .application)
        
        viewModel.resetAgent()
        
        XCTAssertEqual(viewModel.agent.recursionDepth, 0)
        XCTAssertEqual(viewModel.agent.curiosity, .theory)
        XCTAssertEqual(viewModel.agent.domain, .academic)
        XCTAssertEqual(viewModel.agent.evolutionHistory.count, 0)
    }
    
    func testSearchFiltering() {
        // Mock posts for testing
        let mockPosts = [
            BlogPost(id: "1", title: "AI and Cognitive Science", slug: "ai-cognitive", author: "Dr. Oates", tags: ["AI"], audience: ["researchers"], published_at: "2024-01-01", reading_time: 10, complexity_level: 5, invites: [], linked_demos: [], domain_focus: "academic", curiosity_type: "theory"),
            BlogPost(id: "2", title: "Deep Learning Optimization", slug: "deep-learning", author: "Dr. Oates", tags: ["deep learning"], audience: ["engineers"], published_at: "2024-01-02", reading_time: 15, complexity_level: 8, invites: [], linked_demos: [], domain_focus: "industry", curiosity_type: "demo")
        ]
        
        viewModel.allPosts = mockPosts
        viewModel.posts = mockPosts
        
        // Test search by title
        viewModel.searchText = "AI"
        let filteredPosts = viewModel.filteredPosts()
        XCTAssertEqual(filteredPosts.count, 1)
        XCTAssertEqual(filteredPosts.first?.title, "AI and Cognitive Science")
        
        // Test search by author
        viewModel.searchText = "Oates"
        let authorFilteredPosts = viewModel.filteredPosts()
        XCTAssertEqual(authorFilteredPosts.count, 2)
        
        // Test empty search
        viewModel.searchText = ""
        let allPosts = viewModel.filteredPosts()
        XCTAssertEqual(allPosts.count, 2)
    }
    
    func testAgentFiltering() {
        let mockPosts = [
            BlogPost(id: "1", title: "Academic Theory", slug: "academic", author: "Dr. Oates", tags: [], audience: [], published_at: "2024-01-01", reading_time: 10, complexity_level: 5, invites: [], linked_demos: [], domain_focus: "academic", curiosity_type: "theory"),
            BlogPost(id: "2", title: "Industry Demo", slug: "industry", author: "Dr. Oates", tags: [], audience: [], published_at: "2024-01-02", reading_time: 15, complexity_level: 8, invites: [], linked_demos: [], domain_focus: "industry", curiosity_type: "demo")
        ]
        
        viewModel.allPosts = mockPosts
        viewModel.posts = mockPosts
        
        // Test agent filtering when enabled
        viewModel.showOnlyMatchingAgent = true
        viewModel.agent.domain = .academic
        viewModel.agent.curiosity = .theory
        
        let filteredPosts = viewModel.filteredPosts()
        XCTAssertEqual(filteredPosts.count, 1)
        XCTAssertEqual(filteredPosts.first?.domain_focus, "academic")
        
        // Test agent filtering when disabled
        viewModel.showOnlyMatchingAgent = false
        let allPosts = viewModel.filteredPosts()
        XCTAssertEqual(allPosts.count, 2)
    }
    
    func testComplexityFiltering() {
        let mockPosts = [
            BlogPost(id: "1", title: "Simple Post", slug: "simple", author: "Dr. Oates", tags: [], audience: [], published_at: "2024-01-01", reading_time: 5, complexity_level: 3, invites: [], linked_demos: [], domain_focus: "academic", curiosity_type: "theory"),
            BlogPost(id: "2", title: "Complex Post", slug: "complex", author: "Dr. Oates", tags: [], audience: [], published_at: "2024-01-02", reading_time: 20, complexity_level: 9, invites: [], linked_demos: [], domain_focus: "industry", curiosity_type: "demo")
        ]
        
        viewModel.allPosts = mockPosts
        viewModel.posts = mockPosts
        viewModel.agent.recursionDepth = 5
        
        // Test complexity filtering
        viewModel.showOnlyMatchingAgent = true
        let filteredPosts = viewModel.filteredPosts()
        
        // Should only show posts within agent's complexity range
        XCTAssertTrue(filteredPosts.allSatisfy { $0.complexity_level <= viewModel.agent.recursionDepth + 2 })
    }
    
    func testToggleAgentFiltering() {
        XCTAssertFalse(viewModel.showOnlyMatchingAgent)
        
        viewModel.toggleAgentFiltering()
        XCTAssertTrue(viewModel.showOnlyMatchingAgent)
        
        viewModel.toggleAgentFiltering()
        XCTAssertFalse(viewModel.showOnlyMatchingAgent)
    }
    
    func testAgentStatus() {
        XCTAssertEqual(viewModel.agentStatus, "Academic Theorist (Depth: 0)")
        
        viewModel.agent.evolve(basedOn: 5)
        XCTAssertEqual(viewModel.agentStatus, "Academic Theorist (Depth: 5)")
        
        viewModel.agent.userInteraction(type: .demo)
        XCTAssertEqual(viewModel.agentStatus, "Academic Demo Explorer (Depth: 6)")
    }
    
    func testPostCounts() {
        let mockPosts = [
            BlogPost(id: "1", title: "Post 1", slug: "post1", author: "Dr. Oates", tags: [], audience: [], published_at: "2024-01-01", reading_time: 10, complexity_level: 5, invites: [], linked_demos: [], domain_focus: "academic", curiosity_type: "theory"),
            BlogPost(id: "2", title: "Post 2", slug: "post2", author: "Dr. Oates", tags: [], audience: [], published_at: "2024-01-02", reading_time: 15, complexity_level: 8, invites: [], linked_demos: [], domain_focus: "industry", curiosity_type: "demo")
        ]
        
        viewModel.allPosts = mockPosts
        viewModel.posts = mockPosts
        
        XCTAssertEqual(viewModel.totalPostCount, 2)
        XCTAssertEqual(viewModel.matchingPostCount, 2)
        
        viewModel.searchText = "Post 1"
        XCTAssertEqual(viewModel.matchingPostCount, 1)
    }
} 