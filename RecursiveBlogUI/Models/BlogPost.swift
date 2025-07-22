import Foundation

struct BlogPost: Identifiable, Codable {
    let id: String // Stable ID from YAML
    let title: String
    let slug: String
    let author: String
    let tags: [String]
    let audience: [String]
    let published_at: String
    let reading_time: Int
    let complexity_level: Int
    let invites: [String]
    let linked_demos: [String]
    let domain_focus: String? // academic, industry, interdisciplinary
    let curiosity_type: String? // theory, demo, application
    
    // Computed properties for filtering
    var domainFocus: PersonaAgent.DomainFocus? {
        guard let domain = domain_focus else { return nil }
        return PersonaAgent.DomainFocus(rawValue: domain)
    }
    
    var curiosityType: PersonaAgent.CuriosityType? {
        guard let curiosity = curiosity_type else { return nil }
        return PersonaAgent.CuriosityType(rawValue: curiosity)
    }
    
    // Custom initializer for stable IDs
    init(id: String, title: String, slug: String, author: String, tags: [String], 
         audience: [String], published_at: String, reading_time: Int, complexity_level: Int, 
         invites: [String], linked_demos: [String], domain_focus: String? = nil, 
         curiosity_type: String? = nil) {
        self.id = id
        self.title = title
        self.slug = slug
        self.author = author
        self.tags = tags
        self.audience = audience
        self.published_at = published_at
        self.reading_time = reading_time
        self.complexity_level = complexity_level
        self.invites = invites
        self.linked_demos = linked_demos
        self.domain_focus = domain_focus
        self.curiosity_type = curiosity_type
    }
} 