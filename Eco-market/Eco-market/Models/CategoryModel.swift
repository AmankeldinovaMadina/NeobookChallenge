import Foundation
import Alamofire

struct CategoriesModel: Codable {
    let results: []
}
struct CategoryModel: Codable {
    let id: Int
    let name: String
    let image: String
}


class NetworkService {
    static let shared = NetworkService(); private init() {}
    
    private func createURL() URL? {
        let tunnel = "https://"
        let server = "neobook.online/ecobak/"
        let endpoint  = "product-category-list/"
        let urlStr = tunnel + server + endpoint
        
        let url = URL(string: urlStr)
        return url
        
    }
    
    func fetchData(completion: @escaping () -> (Result<CategoriesModel, Error>) ->()) {
        AF.request(createURL())
            .validate()
            .response { response in
                guard let data = response.data else {
                    if let error = response.error{
                        completion(.failure(error))
                    }
                    return
                }
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let userResults  = try? decoder.decode(CategoriesModel, from: data)
            }
    }
    
    
}
