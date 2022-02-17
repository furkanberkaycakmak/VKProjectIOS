//
//  AllProductViewModel.swift
//  VKProject
//
//  Created by Berkay ÇAKMAK on 16.02.2022.
//


protocol AllProductViewModelProtocol: class {
    func getProductAll()
}

class AllProductViewModel {
    
    weak var delegate: AllProductViewModelProtocol?
    
    fileprivate(set) var productAll: [GetProductModel]?
    
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func loadProductAll() {
        networkManager.getProductAll(completion: { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let productAllResponse):
                strongSelf.productAll = productAllResponse
                strongSelf.delegate?.getProductAll()
            case .failure(let error):
                print(String(describing: error))
            }
        })
    }
    
}
