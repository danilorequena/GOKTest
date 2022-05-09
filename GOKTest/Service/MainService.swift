//
//  ListStorage.swift
//  GOKTest
//
//  Created by Danilo Requena on 29/08/20.
//

import Foundation

protocol MainServiceProtocol: AnyObject {
    func fetchData(completion: @escaping (Result<DigioModel, ApiServiceError>) -> ())
}

final class MainService: MainServiceProtocol {
    
    init() {}
    
    private let urlSession = URLSession.shared
    private let jsonDecoder = JSONDecoder()
    
    func fetchData(completion: @escaping (Result<DigioModel, ApiServiceError>) -> ()) {
        let endpoint = MainEndpoint()
        guard let url = URL(string: "\(endpoint.path)") else {
            completion(.failure(.invalidEndpoint))
            return
        }
        
        loadURLAndDecode(url: url, completion: completion)
    }
    
    
    
    private func loadURLAndDecode<D: Decodable>(url: URL, params: [String : String]? = nil, completion: @escaping (Result<D, ApiServiceError>) -> ()) {
        guard let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            completion(.failure(.invalidEndpoint))
            return
        }
        
        guard let finalURL = urlComponents.url else {
            completion(.failure(.invalidEndpoint))
            return
        }
        
        urlSession.dataTask(with: finalURL) { [weak self] data, response, error in
            guard let self = self else { return }
            if error != nil {
                self.executeCompletionHandler(with: .failure(.apiError), completion: completion)
                return
            }
            
            guard let response = response as? HTTPURLResponse, 200..<300 ~= response.statusCode else {
                self.executeCompletionHandler(with: .failure(.invalidResponse), completion: completion)
                return
            }
            
            guard let data = data else {
                self.executeCompletionHandler(with: .failure(.noData), completion: completion)
                return
            }
            
            do {
                let decodedResponse = try self.jsonDecoder.decode(D.self, from: data)
                self.executeCompletionHandler(with: .success(decodedResponse), completion: completion)
            } catch {
                self.executeCompletionHandler(with: .failure(.serializationError), completion: completion)
            }
        }.resume()
    }
    
    private func executeCompletionHandler<D: Decodable>(with result: Result<D, ApiServiceError>, completion: @escaping (Result<D, ApiServiceError>) -> ()) {
        DispatchQueue.main.async {
            completion(result)
        }
    }
}
