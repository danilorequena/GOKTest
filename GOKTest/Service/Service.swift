//
//  ListStorage.swift
//  GOKTest
//
//  Created by Danilo Requena on 29/08/20.
//

import Foundation

enum ListError {
    case url
    case taskError(error: Error)
    case noResponse
    case noData
    case responseStatusCode(code: Int)
    case invalidJSON
}

struct ListCache {
    let listArray: [ModelBase]
}

class Service {
    private static let session = URLSession.shared
    
    class func loadList(urlString: String, onComplete: @escaping (ModelBase) -> Void, onError: @escaping (ListError) -> Void) {
            guard let url = URL(string: urlString) else {
                onError(.url)
                return
            }
            let dataTask = Service.session.dataTask(with: url) {(data, response, error) in
                if error == nil {
                    guard let response = response as? HTTPURLResponse else {
                        onError(.noResponse)
                        print("No Response")
                        return
                    }
                    if response.statusCode == 200 {
                        guard let data = data else { return }
                        do {
                            let decoder = JSONDecoder()
                            let list = try decoder.decode(ModelBase.self, from: data)
                            onComplete(list)
                        } catch let jsonErr as NSError {
                            onError(.invalidJSON)
                            print(jsonErr.localizedDescription)
                            print(jsonErr.debugDescription)
                        }
                    } else {
                        onError(.responseStatusCode(code: response.statusCode))
                        print("Erro no servidor")
                    }
                } else {
                    onError(.taskError(error: error!))
                    print("Algo Errado")
                }
            }
            dataTask.resume()
        }
}
