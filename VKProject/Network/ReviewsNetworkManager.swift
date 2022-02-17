//
//  ReviewsNetworkManager.swift
//  VKProject
//
//  Created by Berkay ÇAKMAK on 16.02.2022.
//

import Moya

protocol NetworkableReview {
    var provider: MoyaProvider<ReviewsAPI> { get }
    func getReviewsAll(reviewsId: String, completion: @escaping (Result<[GetReviewsResponseModel], Error>) -> ())
}

class ReviewsNetworkManager: NetworkableReview {
    var provider = MoyaProvider<ReviewsAPI>(plugins: [NetworkLoggerPlugin()])
    
    func getReviewsAll(reviewsId: String, completion: @escaping (Result<[GetReviewsResponseModel], Error>) -> ())
    {
        request(target: .getreviews(reviewsId: reviewsId), completion: completion)
    }
}

private extension ReviewsNetworkManager {
    private func request<T: Decodable>(target: ReviewsAPI, completion: @escaping (Result<T, Error>) -> ()) {
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
