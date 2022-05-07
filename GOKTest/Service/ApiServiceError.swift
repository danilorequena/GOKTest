//
//  ApiServiceError.swift
//  GOKTest
//
//  Created by Danilo Requena on 07/05/22.
//

import Foundation

enum ApiServiceError: Error, CustomNSError {
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case serializationError
    
    var localizedDescription: String {
        switch self {
        case .apiError:
            return "Failed to fetch data"
        case .invalidEndpoint:
            return "invalid Endpoint"
        case .invalidResponse:
            return "invalid Response"
        case .noData:
            return "No Data"
        case .serializationError:
            return "Failed to Decode data"
        }
    }
    
    var errorUserInfo: [String : Any] {
        [NSLocalizedDescriptionKey: localizedDescription]
    }
}
