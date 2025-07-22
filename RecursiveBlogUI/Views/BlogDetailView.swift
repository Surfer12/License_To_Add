import SwiftUI

struct BlogDetailView: View {
    let post: BlogPost
    @Binding var agent: PersonaAgent

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(post.title).font(.largeTitle)
                Text("Written by \(post.author)").italic()

                ForEach(post.linked_demos, id: \.self) { link in
                    if let url = URL(string: link) {
                        Link("Linked Demo", destination: url)
                    } else {
                        Text("Invalid link: \(link)").foregroundColor(.red)
                    }
                }

                TraceBlockView(traceLevel: post.complexity_level)
                Divider()
                Text("Agent State:").font(.headline)
                Text("Domain: \(agent.domain.rawValue.capitalized)")
                Text("Curiosity: \(agent.curiosity.rawValue.capitalized)")
                Text("Recursion Depth: \(agent.recursionDepth)")
            }
        }
        .onAppear {
            agent.evolve(basedOn: post.complexity_level)
        }
    }
} 