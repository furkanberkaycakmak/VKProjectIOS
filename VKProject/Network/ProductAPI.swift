//
//  ProductAPI.swift
//  VKProject
//
//  Created by Berkay ÇAKMAK on 15.02.2022.
//
import Moya

enum ProductAPI {
    case product(productId: String)
    case getproducts
    case getreviews(reviewsId: String)
    
}

extension ProductAPI: TargetType {
    
    var baseURL: URL {
        var url : URL?
        switch self {
        case .product,.getproducts:
            url = URL(string: "http://localhost:3001/")
        case .getreviews(let reviewsId):
            url = URL(string: "http://localhost:3002/")
        }
        return url!
    }
    
    var path: String {
        switch self {
        case .product(let productId):
            return "product/\(productId)"
            
        case .getproducts:
            return "product"
            
        case .getreviews(let reviewsId):
                return "reviews/\(reviewsId)"
            
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var method: Method {
        return .get
    }
    
    public var task: Task {
        switch self {
        case .product:
            return .requestParameters(parameters: [:], encoding: URLEncoding.queryString)
        case .getproducts:
            return .requestParameters(parameters: [:], encoding: URLEncoding.queryString)
        case .getreviews:
            return .requestParameters(parameters: [:], encoding: URLEncoding.queryString)
        }
    }
    public var headers: [String : String]? {
        return nil
    }
}
