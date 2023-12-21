import Foundation

struct Product: Codable {
    let id: Int
    let title: String
    let description: String
    let category: Int
    let image: String
    let quantity: Int
    let price: String
}

class NetworkServiceProduct {
    static let shared = NetworkServiceProduct()
    private init() {}
    
//    private func createURL() -> URl? {
//        let baseURl = "https://neobook.online/ecobak/"
//        let endpoint = ""
//    }
    
}
