//
//  MainEndpoint.swift
//  GOKTest
//
//  Created by Danilo Requena on 07/05/22.
//

import Foundation

struct MainEndpoint: Endpoint {
    let requestType: RequestType = .request
    let method: MethodHTTP = .get
    let path: String = "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/sandbox/products"
    let parameterEncoding: ParameterEncoding = .json

    var parameters: [String: Any]?
    var headers: [String: String]?
    var queryItems: [URLQueryItem]?
}
