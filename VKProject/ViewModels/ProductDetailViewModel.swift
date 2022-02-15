//
//  MainViewModel.swift
//  VKProject
//
//  Created by Berkay ÇAKMAK on 10.02.2022.
//

protocol ProductDetailViewModelProtocol: class {
    func getProductDetail()
}

class ProductDetailViewModel {
    
    weak var delegate: ProductDetailViewModelProtocol?
    
    fileprivate(set) var productDetail: GetProductDetailsResponseModel?
    
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
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
    
}



