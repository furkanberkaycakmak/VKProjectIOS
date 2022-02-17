//
//  ReviewAPI.swift
//  VKProject
//
//  Created by Berkay ÇAKMAK on 15.02.2022.
//

import Moya

enum ReviewsAPI {
    case getreviews(reviewsId: String)
}

extension ReviewsAPI: TargetType {
    
    var baseURL: URL {
        guard let url = URL(string: "http://localhost:3002/") else { fatalError() }
        return url
    }
    
    var path: String {
        switch self {
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
        case .getreviews:
            return .requestParameters(parameters: [:], encoding: URLEncoding.queryString)
        }
    }
    public var headers: [String : String]? {
        return nil
    }
}
