import Foundation
import Alamofire

struct CategoriesModel: Codable {
    let results: [CategoryModel]
}
struct CategoryModel: Codable {
    let id: Int
    let name: String
    let image: String
}

enum NetworkingError: Error {
    case invalidData
}


class NetworkService {
    static let shared = NetworkService()
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
    
    func fetchData(completion: @escaping (Result<CategoriesModel, Error>) ->()) {
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
                        // Decode directly into ProductCategoryListResponse
                        let categoriesResults = try decoder.decode(CategoriesModel.self, from: data!)
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
