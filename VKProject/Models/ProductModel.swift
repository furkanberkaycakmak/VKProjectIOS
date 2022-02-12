//
//  productModel.swift
//  VKProject
//
//  Created by Berkay ÇAKMAK on 10.02.2022.
//

import Foundation

class ProductModel: Codable {
    let id : String
    let name : String
    let description : String
    let currency : String
    let price : Double
    let imgUrl : String
  }

