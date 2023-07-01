import Foundation

enum NetworkError: Error {
    case requestFailed
    case invalidResponse
    case decodingFailed
    case noData
    case unknownError
    
    var localizedDescription: String {
        switch self {
        case .requestFailed:
            return "Request failed"
        case .invalidResponse:
            return "Invalid response received"
        case .decodingFailed:
            return "Decoding failed"
        case .noData:
            return "No Data"
        case .unknownError:
            return "Unknown Error"
        }
    }
}
