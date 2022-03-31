//
//  NetworkManager.swift
//  VKProject
//
//  Created by Berkay ÇAKMAK on 17.02.2022.
//

import Moya

protocol Networkable {
    var provider: MoyaProvider<API> { get }
    
    func fetchGetProductDetails(id: String, completion: @escaping (Result<GetProductDetailsResponseModel, Error>) -> ())
    func fetchPostProduct(completion: @escaping (Result<PostProductResponseModel, Error>) -> ())
    func fetchGetProduct(completion: @escaping (Result<[ProductResponseModel], Error>) -> ())
    func fetchDeleteProduct(id: String, completion: @escaping (Result<DeleteProductResponseModel, Error>) -> ())
    func fetchUpdateProduct(id: String, completion: @escaping (Result<UpdateProductResponseResult, Error>) -> ())
    func fetchPostReviews(id: String, completion: @escaping (Result<PostReviewsResponseResult, Error>) -> ())
    func fetchGetReviewsDetails(id: String, completion: @escaping (Result<GetReviewsResponseModel, Error>) -> ())
}

class NetworkManager: Networkable {
    
    var provider = MoyaProvider<API>(plugins: [NetworkLoggerPlugin()])
    
    func fetchGetProductDetails(id: String, completion: @escaping (Result<GetProductDetailsResponseModel, Error>) -> ()) {
        request(target: .getproductbyid(id: "id"), completion: completion)
    }
    
    func fetchGetProduct(completion: @escaping (Result<[ProductResponseModel], Error>) -> ()) {
        request(target: .getproduct, completion: completion)
    }

    func fetchPostProduct(completion: @escaping (Result<PostProductResponseModel, Error>) -> ()) {
        request(target: .postproduct(id: "DORUK", name: "NAMEDORUK", description: "DESCRIPTIONDORUK", imgUrl: "URL"), completion: completion)
    }
    
    func fetchDeleteProduct(id: String, completion: @escaping (Result<DeleteProductResponseModel, Error>) -> ()) {
        request(target: .deleteproductbyid(id: "id"), completion: completion)
    }
    
    func fetchUpdateProduct(id: String, completion: @escaping (Result<UpdateProductResponseResult, Error>) -> ()) {
        request(target: .putproductbyid(id: "id", bodyid: "id", name: "name", description: "description", imgUrl: "imgUrl"), completion: completion)
    }
    
    func fetchPostReviews(id: String, completion: @escaping (Result<PostReviewsResponseResult, Error>) -> ()) {
        request(target: .postreviewsbyid(id: "id", productId: "productId", locale: "locale", rating: 3, text: "text"), completion: completion)
    }
    
    func fetchGetReviewsDetails(id: String, completion: @escaping (Result<GetReviewsResponseModel, Error>) -> ()) {
        request(target: .getreviewsbyid(id: "id"), completion: completion)
    }
}

private extension NetworkManager {
    private func request<T: Decodable>(target: API, completion: @escaping (Result<T, Error>) -> ()) {
        provider.request(target) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(results))
                } catch let error {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}

