import Foundation
import Alamofire

struct Category: Codable {
    let id: Int
    let name: String
    let image: String
}

enum NetworkingError: Error {
    case invalidData
}


class NetworkServiceCategory {
    static let shared = NetworkServiceCategory()
    private init() {}
    
    private func createURL() -> URL? {
        let baseURL = "https://neobook.online/ecobak/"
        let endpoint  = "product-category-list/"
        let urlStr = baseURL + endpoint
        
        if let url = URL(string: urlStr) {
                   return url
               } else {
                   return nil
               }
        
    }
    
    func fetchData(completion: @escaping (Result<[Category], Error>) ->()) {
        guard let url = createURL() else {
            completion(.failure(NetworkingError.invalidData))
            return
        }
        
        
        AF.request(url)
            .validate()
            .response { response in
                switch response.result {
                case .success(let data):
                    print("Raw Data: \(String(data: data!, encoding: .utf8) ?? "No data")")
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    do {
                        let categoriesResults = try decoder.decode([Category].self, from: data!)
                        completion(.success(categoriesResults))
                        print("Decoded Results: \(categoriesResults)")
                    } catch {
                        completion(.failure(error))
                        print("Error Decoding: \(error)")
                    }
                    
                case .failure(let error):
                    completion(.failure(error))
                    print("Network Request Failure: \(error)")
                }
            }
    }
}
