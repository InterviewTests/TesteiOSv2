import Foundation

func makeApiUrl(path: String) -> URL {
    guard let baseUrl = Environment.variable(.baseUrl),
        let url = URL(string: "\(baseUrl)/\(path)") else {
            fatalError("Unconstructable \(path) URL")
    }
    return url
}
