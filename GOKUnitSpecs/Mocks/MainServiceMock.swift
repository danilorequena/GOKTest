//
//  MainServiceMock.swift
//  GOKUnitSpecs
//
//  Created by Danilo Requena on 09/05/22.
//

import Foundation

@testable
import GOKTest

final class MainServiceMock: MainServiceProtocol {
    var dataResult: Result<DigioModel, ApiServiceError>?
    
    func fetchData(completion: @escaping (Result<DigioModel, ApiServiceError>) -> ()) {
        if let result = dataResult {
            completion(result)
        }
    }
}
