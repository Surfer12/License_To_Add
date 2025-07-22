import Foundation

struct TemporalAccessNode: Identifiable, Codable {
    let id: String // BlogPost ID
    var accessTimes: [Date]
    var title: String
}

struct TemporalAccessEdge: Codable {
    let fromID: String
    let toID: String
    let transitionTime: Date
}

struct TemporalAccessGraph: Codable {
    var nodes: [String: TemporalAccessNode] = [:]
    var edges: [TemporalAccessEdge] = []
    
    mutating func recordAccess(post: BlogPost, at time: Date = Date()) {
        if var node = nodes[post.id] {
            node.accessTimes.append(time)
            nodes[post.id] = node
        } else {
            nodes[post.id] = TemporalAccessNode(id: post.id, accessTimes: [time], title: post.title)
        }
        // Optionally, add edge from last accessed post
        if let last = lastAccessedID, last != post.id {
            edges.append(TemporalAccessEdge(fromID: last, toID: post.id, transitionTime: time))
        }
        lastAccessedID = post.id
    }
    
    private var lastAccessedID: String? = nil
    
    func recentHistory(limit: Int = 10) -> [TemporalAccessNode] {
        let sorted = nodes.values.sorted { ($0.accessTimes.last ?? .distantPast) > ($1.accessTimes.last ?? .distantPast) }
        return Array(sorted.prefix(limit))
    }
} 