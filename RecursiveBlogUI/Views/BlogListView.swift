import SwiftUI

struct BlogListView: View {
    @ObservedObject var viewModel: BlogViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                // Search and filter controls
                VStack(spacing: 12) {
                    // Search bar
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.secondary)
                        TextField("Search posts...", text: $viewModel.searchText)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    
                    // Agent controls
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Agent: \(viewModel.agentStatus)")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        
                        Spacer()
                        
                        Button(action: viewModel.toggleAgentFiltering) {
                            HStack {
                                Image(systemName: viewModel.showOnlyMatchingAgent ? "person.fill" : "person")
                                Text(viewModel.showOnlyMatchingAgent ? "Agent Filter ON" : "Agent Filter OFF")
                            }
                            .font(.caption)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(viewModel.showOnlyMatchingAgent ? Color.blue : Color.gray.opacity(0.3))
                            .foregroundColor(viewModel.showOnlyMatchingAgent ? .white : .primary)
                            .cornerRadius(8)
                        }
                    }
                    
                    // Results count
                    Text("\(viewModel.matchingPostCount) of \(viewModel.totalPostCount) posts")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal)
                
                // Error display
                if let error = viewModel.errorMessage {
                    Text("Error: \(error)")
                        .foregroundColor(.red)
                        .padding()
                }
                
                // Posts list
                List(viewModel.filteredPosts()) { post in
                    NavigationLink(destination: BlogDetailView(post: post, agent: $viewModel.agent)) {
                        BlogPostRowView(post: post, agent: viewModel.agent)
                    }
                }
            }
            .navigationTitle("Recursive Blog")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Reset Agent") {
                        viewModel.resetAgent()
                    }
                    .foregroundColor(.red)
                }
            }
        }
    }
}

struct BlogPostRowView: View {
    let post: BlogPost
    let agent: PersonaAgent
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(post.title)
                    .font(.headline)
                    .lineLimit(2)
                
                Spacer()
                
                // Complexity indicator
                ComplexityIndicator(level: post.complexity_level, agentDepth: agent.recursionDepth)
            }
            
            Text("by \(post.author)")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            // Tags
            if !post.tags.isEmpty {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(post.tags, id: \.self) { tag in
                            Text(tag)
                                .font(.caption)
                                .padding(.horizontal, 6)
                                .padding(.vertical, 2)
                                .background(Color.blue.opacity(0.2))
                                .foregroundColor(.blue)
                                .cornerRadius(4)
                        }
                    }
                }
            }
            
            HStack {
                Text("\(post.reading_time) min read")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Spacer()
                
                if !post.linked_demos.isEmpty {
                    Image(systemName: "link")
                        .foregroundColor(.blue)
                        .font(.caption)
                }
            }
        }
        .padding(.vertical, 4)
    }
}

struct ComplexityIndicator: View {
    let level: Int
    let agentDepth: Int
    
    var body: some View {
        HStack(spacing: 2) {
            ForEach(0..<min(level, 5), id: \.self) { _ in
                Circle()
                    .fill(level <= agentDepth + 2 ? Color.green : Color.orange)
                    .frame(width: 6, height: 6)
            }
        }
    }
} 