//
//  ProductDetailsVC.swift
//  VKProject
//
//  Created by Berkay ÇAKMAK on 14.02.2022.
//

import UIKit

class ProductDetailsVC: UIViewController {
    
    private let viewModel = ProductDetailViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.delegate = self
        viewModel.loadProductDetail(productId: "HI333")
        
        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ProductDetailsVC: ProductDetailViewModelProtocol {
    
    func getProductDetail() {
        print(viewModel.productDetail)
    }
}
