import SwiftUI

@main
struct RecursiveBlogUIApp: App {
    @StateObject private var viewModel = BlogViewModel()
    var body: some Scene {
        WindowGroup {
            BlogListView(viewModel: viewModel)
        }
    }
} 