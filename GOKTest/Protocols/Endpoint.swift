//
//  Endpoint.swift
//  GOKTest
//
//  Created by Danilo Requena on 07/05/22.
//

import Foundation

public enum MethodHTTP: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

public enum RequestType {
    case request
}

public enum ParameterEncoding {
    case json
    case url
}

public protocol Endpoint {
    var parameterEncoding: ParameterEncoding { get }
    var requestType: RequestType { get }
    var method: MethodHTTP { get }
    var path: String { get }
    var parameters: [String: Any]? { get }
    var headers: [String: String]? { get }
    var queryItems: [URLQueryItem]? { get }
    func errorMessage(with statusCode: Int) -> PrintableError?
}

public extension Endpoint {
    func errorMessage(with _: Int) -> PrintableError? {
        nil
    }
}
