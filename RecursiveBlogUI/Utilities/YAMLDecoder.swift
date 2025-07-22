import Foundation
import Yams

struct BlogPostYAMLLoader {
    static func loadBlogPosts() -> Result<[BlogPost], Error> {
        guard let path = Bundle.main.path(forResource: "post-metadata", ofType: "yaml") else {
            return .failure(NSError(domain: "YAML", code: 1, userInfo: [NSLocalizedDescriptionKey: "YAML file not found"]))
        }
        do {
            let contents = try String(contentsOfFile: path)
            let decoder = Yams.YAMLDecoder()
            let decoded = try decoder.decode([BlogPost].self, from: contents)
            return .success(decoded)
        } catch {
            return .failure(error)
        }
    }
} 