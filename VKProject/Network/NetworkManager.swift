//
//  NetworkManager.swift
//  VKProject
//
//  Created by Berkay ÇAKMAK on 15.02.2022.
//

import Moya

protocol Networkable {
    var provider: MoyaProvider<ProductAPI> { get }
    func fetchProductDetail(productId: String, completion: @escaping (Result<GetProductDetailsResponseModel, Error>) -> ())
    func getProductAll(completion: @escaping (Result<[GetProductModel], Error>) -> ())
    func getReviewsAll(reviewsId: String, completion: @escaping (Result<[GetReviewsResponseModel], Error>) -> ())
}

class NetworkManager: Networkable {

    
    var provider = MoyaProvider<ProductAPI>(plugins: [NetworkLoggerPlugin()])
    

    func fetchProductDetail(productId: String, completion: @escaping (Result<GetProductDetailsResponseModel, Error>) -> ())
    {
        request(target: .product(productId: productId), completion: completion)
    }
    
    func getProductAll(completion: @escaping (Result<[GetProductModel], Error>) -> ())
    {
        request(target: .getproducts, completion: completion)
    }
    
    func getReviewsAll(reviewsId: String, completion: @escaping (Result<[GetReviewsResponseModel], Error>) -> ())
    {
        request(target: .getreviews(reviewsId: reviewsId), completion: completion)
    }
}

private extension NetworkManager {
    private func request<T: Decodable>(target: ProductAPI, completion: @escaping (Result<T, Error>) -> ()) {
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
