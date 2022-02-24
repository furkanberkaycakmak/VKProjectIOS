//
//  ProductAPI.swift
//  VKProject
//
//  Created by Berkay ÇAKMAK on 15.02.2022.
//
import Moya

enum API {
    case getproduct
    case postproduct(id: String,name: String,description: String,imgUrl: String)
    case getproductbyid(id: String)
    case putproductbyid(id: String, bodyid: String,name: String,description: String,imgUrl: String)
    case deleteproductbyid(id: String)
    case getreviewsbyid(id: String)
    case postreviewsbyid(id: String, productId: String, locale: String, rating: Int, text: String)
    
}
extension API: TargetType {
    var baseURL: URL {
        var url : URL?
        switch self {
        case .getproduct,.postproduct,.getproductbyid,.putproductbyid,.deleteproductbyid:
            url = URL(string: "http://localhost:3001")
        case .getreviewsbyid,.postreviewsbyid:
            url = URL(string: "http://localhost:3002")
        }
        return url!
    }
    
    public var path: String {
      switch self {
      case .getproduct:
          return "/product"
      case .postproduct:
          return "/product"
      case .getproductbyid(let id):
          return "/product/\(id)"
      case .putproductbyid(let id,_,_,_,_):
          return "/product/\(id)"
      case .deleteproductbyid(let id):
          return "/product/\(id)"
      case .getreviewsbyid(let id):
          return "reviews/\(id)"
      case .postreviewsbyid(let id, _, _, _, _):
          return "reviews/\(id)"
      }
    }
    
    public var method: Moya.Method {
        switch self {
        case .getproduct:
            return .get
        case .postproduct:
            return .post
        case .getproductbyid:
            return .get
        case .putproductbyid:
            return .put
        case .deleteproductbyid:
            return .delete
        case .getreviewsbyid:
            return .get
        case .postreviewsbyid:
            return .post
        }
    }
    
    public var sampleData: Data {
       /* switch self {
        case .getproduct:
            return Data()
        case .postproduct(let id,let name,let description,let imgUrl):
            return "{\"id\": \"\(id)\", \"name\": \"\(name)\", \"description\": \"\(description)\", \"imgUrl\": \"\(imgUrl)\"}".utf8Encoded
        case .getproductbyid(let id):
            return "{\"id\": \"\(id)\"}".utf8Encoded
        case .putproductbyid(_, let bodyid, let name, let description, let imgUrl):
            return "{\"id\": \"\(bodyid)\", \"name\": \"\(name)\", \"description\": \"\(description)\", \"imgUrl\": \"\(imgUrl)\"}".utf8Encoded
        case .deleteproductbyid(let id):
            return "{\"id\": \"\(id)\"}".utf8Encoded
        case .getreviewsbyid(let id):
            return "{\"id\": \"\(id)\"}".utf8Encoded
        case .postreviewsbyid(let id, let productId, let locale, let rating, let text):
            return "{\"id\": \"\(id)\", \"productId\": \"\(productId)\", \"locale\": \"\(locale)\", \"rating\": \"\(rating)\",\"text\": \"\(text)\"}".utf8Encoded
        }*/
        return Data()
    }

    public var task: Task {
        switch self {
        case .getproduct:
            return .requestPlain
        case let .postproduct(id,name,description,imgUrl):
            return .requestParameters(parameters:["id": id,
                                                  "name": name,
                                                  "description": description,
                                                  "imgUrl": imgUrl], encoding: JSONEncoding.default)
        case .getproductbyid:
            return .requestPlain
        case let .putproductbyid(id,bodyid,name,description,imgUrl):
            return .requestParameters(parameters: [  "id": bodyid,
                                                     "name": name,
                                                     "description": description,
                                                     "imgUrl": imgUrl ], encoding: JSONEncoding.default)
        case .deleteproductbyid:
            return .requestParameters(parameters: [:], encoding: JSONEncoding.default)
        case .getreviewsbyid:
            return .requestPlain
        case .postreviewsbyid:
            return .requestParameters(parameters: [  "productId": "string",
                                                     "locale": "string",
                                                     "rating": 0,
                                                     "text": "string"], encoding: JSONEncoding.default)
        }
    }
    
    public var headers: [String: String]? {
        switch self {
        case .getproduct:
            return ["Content-Type": "application/json"]
        case .postproduct:
            return ["Content-Type": "application/json"]
        case .getproductbyid:
            return ["Content-Type": "application/json"]
        case .putproductbyid:
            return ["Content-Type": "application/json"]
        case .deleteproductbyid:
            return ["Content-Type": "application/json"]
        case .getreviewsbyid:
            return ["Content-Type": "application/json"]
        case .postreviewsbyid:
            return ["Content-Type": "application/json"]
        }
    }
    public var validationType: ValidationType {
      return .successCodes
    }
}
private extension String {
    var urlEscaped: String {
        addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }

    var utf8Encoded: Data { Data(self.utf8) }
}
