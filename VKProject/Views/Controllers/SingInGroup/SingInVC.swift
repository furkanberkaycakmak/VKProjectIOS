//
//  ViewController.swift
//  VKProject
//
//  Created by Berkay ÇAKMAK on 10.02.2022.
//

import UIKit
import Moya


class SingInVC: UIViewController {

    let provider = MoyaProvider<API>()
    
    private let viewModel = TestingViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        viewModel.loadProductAll()
        

        // 2
    /*  provider.request(.postproduct) { [weak self] result in
          guard let _ = self else { return }

          // 3
          switch result {
          case .success(let response):
            do {
              // 4
              print(try response.mapJSON())
            } catch {
              print("fail")
            }
          case .failure:
            // 5
              print("error")
          }
        }*/
        
        
        // Do any additional setup after loading the view.
    }


}

extension SingInVC: ViewModelProtocol {
    func tryFetchGetProductDetails() {
        print(viewModel.getProductDetail)
    }
    
    func tryFetchPostProduct() {
        print(viewModel.postProduct)
    }
    
    func tryFetchGetProduct() {
        print(viewModel.getProduct)
    }
    
    func tryFetchDeleteProduct() {
        print(viewModel.deleteProduct)
    }
    
    func tryFetchUpdateProduct() {
        print(viewModel.updateProduct)
    }
    
    func tryFetchPostReviews() {
        print(viewModel.postReviews)
    }
    
    func tryFetchGetReviewsDetails() {
        print(viewModel.getReviews)
    }
    
    
}
