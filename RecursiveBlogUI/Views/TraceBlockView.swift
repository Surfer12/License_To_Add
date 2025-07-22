import SwiftUI

struct TraceBlockView: View {
    let traceLevel: Int
    @Binding var agent: PersonaAgent
    @State private var showingHistory = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("🧠 Thought Trace")
                    .font(.headline)
                Spacer()
                Button(action: { showingHistory.toggle() }) {
                    Image(systemName: "clock.arrow.circlepath")
                        .foregroundColor(.blue)
                }
            }
            
            // Current trace content
            if traceLevel > 7 {
                Text("Symbolic Transform: ∀ f: A → B, ∃ id_B ∘ f = f")
                    .font(.system(.body, design: .monospaced))
            } else {
                Text("Premise: Exploring cognitive modeling via category theory.")
            }
            
            // Agent status
            VStack(alignment: .leading, spacing: 8) {
                Text("Agent: \(agent.evolutionStage)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text("Depth: \(agent.recursionDepth) | Curiosity: \(agent.curiosity.rawValue)")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            // User interaction controls
            HStack(spacing: 8) {
                ForEach(PersonaAgent.CuriosityType.allCases, id: \.self) { type in
                    Button(action: {
                        agent.userInteraction(type: type)
                    }) {
                        Text(type.rawValue.capitalized)
                            .font(.caption)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(agent.curiosity == type ? Color.blue : Color.gray.opacity(0.3))
                            .foregroundColor(agent.curiosity == type ? .white : .primary)
                            .cornerRadius(8)
                    }
                }
            }
            
            // Contact prompt
            if agent.shouldShowContactPrompt {
                Text("🤝 Ready for deeper collaboration?")
                    .font(.caption)
                    .foregroundColor(.green)
                    .padding(.top, 4)
            }
        }
        .padding()
        .background(Color.yellow.opacity(0.1))
        .cornerRadius(10)
        .sheet(isPresented: $showingHistory) {
            AgentHistoryView(agent: $agent)
        }
    }
}

struct AgentHistoryView: View {
    @Binding var agent: PersonaAgent
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            List {
                ForEach(agent.evolutionHistory.indices, id: \.self) { index in
                    let event = agent.evolutionHistory[index]
                    VStack(alignment: .leading, spacing: 4) {
                        Text(event.trigger)
                            .font(.headline)
                        Text("Depth: \(event.oldDepth) → \(event.newDepth)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        if let newCuriosity = event.newCuriosity {
                            Text("Curiosity: \(event.oldCuriosity.rawValue) → \(newCuriosity.rawValue)")
                                .font(.caption)
                                .foregroundColor(.blue)
                        }
                        Text(event.timestamp, style: .time)
                            .font(.caption2)
                            .foregroundColor(.secondary)
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("Evolution History")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Reset") {
                        agent.reset()
                        dismiss()
                    }
                    .foregroundColor(.red)
                }
            }
        }
    }
} 