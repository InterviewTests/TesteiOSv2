import Foundation

func makeUrl() -> URL {
    return URL(string: "http://url.com")!
}

func makeEmptyData() -> Data {
    return Data()
}

func makeValidData() -> Data {
    return Data("{\"name\":\"gabriel\"}".utf8)
}

func makeInvalidData() -> Data {
    return Data("invalid_json".utf8)
}

func makeError() -> Error {
    return NSError(domain: "any_error", code: 0)
}

func makeHttpResponse(statusCode: Int = 200) -> HTTPURLResponse {
    return HTTPURLResponse(url: makeUrl(), statusCode: statusCode, httpVersion: nil, headerFields: nil)!
}
