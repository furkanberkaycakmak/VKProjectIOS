//
//  TestingViewModel.swift
//  VKProject
//
//  Created by Berkay ÇAKMAK on 18.02.2022.
//

import Foundation

protocol ViewModelProtocol: AnyObject {
    func tryFetchGetProductDetails()
    
    func tryFetchPostProduct()
    
    func tryFetchGetProduct()
    
    func tryFetchDeleteProduct()
    
    func tryFetchUpdateProduct()
    
    func tryFetchPostReviews()
    
    func tryFetchGetReviewsDetails()
}

class TestingViewModel {
    weak var delegate: ViewModelProtocol?
    
    fileprivate(set) var getProductDetail: GetProductDetailsResponseModel?
    fileprivate(set) var postProduct: PostProductResponseModel?
    fileprivate(set) var getProduct: [ProductResponseModel]? = []
    fileprivate(set) var deleteProduct: DeleteProductResponseModel?
    fileprivate(set) var updateProduct: UpdateProductResponseResult?
    fileprivate(set) var postReviews: PostReviewsResponseResult?
    fileprivate(set) var getReviews: [GetReviewsResponseModel]? = []
    

    
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
        
    }
    
    
    // MARK: - FUNCTIONS
    
    
    func postFetchPostProduct() {
        networkManager.fetchPostProduct(completion:  { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let postProductResponse):
                strongSelf.postProduct = postProductResponse
                strongSelf.delegate?.tryFetchPostProduct()
            case .failure(let error):
                print(String(describing : error))
            }
        })
    }
    
    func loadProductAll() {
            networkManager.fetchGetProduct(completion: { [weak self] result in
                guard let strongSelf = self else { return }
                switch result {
                case .success(let productAllResponse):
                    strongSelf.getProduct = productAllResponse
                    strongSelf.delegate?.tryFetchGetProduct()
                case .failure(let error):
                    print(String(describing: error))
                }
            })
        }
    func loadFetchGetProductDetails(with id: String) {
        networkManager.fetchGetProductDetails(id: id, completion:  { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let productDetailResponse):
                strongSelf.getProductDetail = productDetailResponse
                strongSelf.delegate?.tryFetchGetProductDetails()
            case .failure(let error):
                print(String(describing : error))
            }
        })
    }
    
    func loadFetchDeleteProduct(with id: String) {
        networkManager.fetchDeleteProduct(id: id, completion:  { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let deleteProductResponse):
                strongSelf.deleteProduct = deleteProductResponse
                strongSelf.delegate?.tryFetchDeleteProduct()
            case .failure(let error):
                print(String(describing : error))
            }
        })
    }
    
    func loadFetchUpdateProduct(with id: String) {
        networkManager.fetchUpdateProduct(id: id, completion:  { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let updateProductResponse):
                strongSelf.updateProduct = updateProductResponse
                strongSelf.delegate?.tryFetchUpdateProduct()
            case .failure(let error):
                print(String(describing : error))
            }
        })
    }
    
    func loadFetchPostReviews(with id: String) {
        networkManager.fetchPostReviews(id: id, completion:  { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let postReviewsResponse):
                strongSelf.postReviews = postReviewsResponse
                strongSelf.delegate?.tryFetchPostReviews()
            case .failure(let error):
                print(String(describing : error))
            }
        })
    }
    
    
  /*  func loadFetchGetReviewsDetails(with id: String) {
        networkManager.fetchGetReviewsDetails(id: id, completion:  { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let getReviewsResponse):
                strongSelf.getReviews = getReviewsResponse
                strongSelf.delegate?.tryFetchGetReviewsDetails()
            case .failure(let error):
                print(String(describing : error))
            }
        })
    }
   
   */
}
