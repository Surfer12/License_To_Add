import Foundation

struct ContentHierarchyNode: Identifiable, Codable {
    let id: String
    let title: String
    let level: HierarchyLevel
    var children: [ContentHierarchyNode] = []
    var postIDs: [String] = [] // BlogPost IDs at this node
    
    enum HierarchyLevel: String, Codable {
        case domain, subdomain, topic
    }
}

struct ContentHierarchy: Codable {
    var rootNodes: [ContentHierarchyNode] = []
    
    // Example: Find all posts under a domain
    func posts(forDomain domainID: String) -> [String] {
        guard let domain = rootNodes.first(where: { $0.id == domainID }) else { return [] }
        return collectPostIDs(node: domain)
    }
    
    private func collectPostIDs(node: ContentHierarchyNode) -> [String] {
        var ids = node.postIDs
        for child in node.children {
            ids.append(contentsOf: collectPostIDs(node: child))
        }
        return ids
    }
} 