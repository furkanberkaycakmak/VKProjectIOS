//
//  MainViewModel.swift
//  VKProject
//
//  Created by Berkay ÇAKMAK on 10.02.2022.
//

protocol ProductDetailViewModelProtocol: class {
    func getProductDetail()
    func getReviewsAll()
}

class ProductDetailViewModel {
    
    weak var delegate: ProductDetailViewModelProtocol?
    
    fileprivate(set) var productDetail: GetProductDetailsResponseModel?
    fileprivate(set) var reviewsAll: [GetReviewsResponseModel]?
    
    private let networkManager: NetworkManager
    private let reviewsNetworkManager: ReviewsNetworkManager
    
    init(networkManager: NetworkManager = NetworkManager(),reviewsNetworkManager: ReviewsNetworkManager = ReviewsNetworkManager()) {
        self.networkManager = networkManager
        self.reviewsNetworkManager = reviewsNetworkManager
    }
    
    func loadProductDetail(productId: String) {
        networkManager.fetchProductDetail(productId: productId, completion: { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let productDetailResponse):
                strongSelf.productDetail = productDetailResponse
                strongSelf.delegate?.getProductDetail()
            case .failure(let error):
                print(String(describing: error))
            }
        })
    }
    
    func loadAllReviews(reviewsId: String) {
        reviewsNetworkManager.getReviewsAll(reviewsId: reviewsId, completion: { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let reviewsAllResponse):
                strongSelf.reviewsAll = reviewsAllResponse
                strongSelf.delegate?.getReviewsAll()
            case .failure(let error):
                print(String(describing: error))
            }
        })
    }
    
}



