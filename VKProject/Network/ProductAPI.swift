//
//  ProductAPI.swift
//  VKProject
//
//  Created by Berkay ÇAKMAK on 15.02.2022.
//
import Moya

enum ProductAPI {
    case product(productId: String)
}

extension ProductAPI: TargetType {
    
    var baseURL: URL {
        guard let url = URL(string: "http://localhost:3001/") else { fatalError() }
        return url
    }
    
    var path: String {
        switch self {
        case .product(let productId):
            return "product/\(productId)"
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
        }
    }
    public var headers: [String : String]? {
        return nil
    }
}
