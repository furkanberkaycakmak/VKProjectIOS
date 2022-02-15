//
//  ViewController.swift
//  VKProject
//
//  Created by Berkay ÇAKMAK on 10.02.2022.
//

import UIKit

class SingInVC: UIViewController {
    
    private let viewModel = ProductDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.delegate = self
        viewModel.loadProductDetail(productId: "HI333")
        
    }


}

extension SingInVC: ProductDetailViewModelProtocol {
    
    func getProductDetail() {
        print(viewModel.productDetail?.id as! String)
    }
}

