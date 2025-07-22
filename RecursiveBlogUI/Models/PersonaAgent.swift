import Foundation

struct PersonaAgent: Codable {
    enum DomainFocus: String, CaseIterable, Codable { 
        case academic, industry, interdisciplinary 
    }
    enum CuriosityType: String, CaseIterable, Codable { 
        case theory, demo, application 
    }
    
    var domain: DomainFocus
    var curiosity: CuriosityType
    var recursionDepth: Int = 0
    var invitesContact: Bool = false
    var evolutionHistory: [EvolutionEvent] = []
    var lastInteraction: Date = Date()
    
    struct EvolutionEvent: Codable {
        let timestamp: Date
        let trigger: String
        let oldDepth: Int
        let newDepth: Int
        let oldCuriosity: CuriosityType
        let newCuriosity: CuriosityType?
    }
    
    mutating func evolve(basedOn trace: Int) {
        let oldDepth = recursionDepth
        let oldCuriosity = curiosity
        
        recursionDepth += trace
        
        // Evolve curiosity based on depth and complexity
        if recursionDepth > 10 {
            curiosity = .theory
        } else if recursionDepth > 5 {
            curiosity = .demo
        }
        
        // Record evolution event
        let event = EvolutionEvent(
            timestamp: Date(),
            trigger: "Complexity level: \(trace)",
            oldDepth: oldDepth,
            newDepth: recursionDepth,
            oldCuriosity: oldCuriosity,
            newCuriosity: curiosity != oldCuriosity ? curiosity : nil
        )
        evolutionHistory.append(event)
        lastInteraction = Date()
    }
    
    mutating func userInteraction(type: CuriosityType) {
        let oldCuriosity = curiosity
        curiosity = type
        recursionDepth += 1
        
        let event = EvolutionEvent(
            timestamp: Date(),
            trigger: "User interaction: \(type.rawValue)",
            oldDepth: recursionDepth - 1,
            newDepth: recursionDepth,
            oldCuriosity: oldCuriosity,
            newCuriosity: curiosity
        )
        evolutionHistory.append(event)
        lastInteraction = Date()
    }
    
    mutating func reset() {
        recursionDepth = 0
        curiosity = .theory
        evolutionHistory.removeAll()
        lastInteraction = Date()
    }
    
    // Computed properties for UI
    var evolutionStage: String {
        switch recursionDepth {
        case 0...2: return "Novice"
        case 3...5: return "Explorer"
        case 6...8: return "Scholar"
        case 9...12: return "Sage"
        default: return "Master"
        }
    }
    
    var shouldShowContactPrompt: Bool {
        return recursionDepth > 8 && !invitesContact
    }
} 