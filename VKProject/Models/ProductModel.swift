//
//  productModel.swift
//  VKProject
//
//  Created by Berkay ÇAKMAK on 10.02.2022.
//

import Foundation

class GetProductModel: Codable {
    let currency : String
    let price : Double
    let id : String
    let name : String
    let description : String
    let imgUrl : String
  }

class PostProductModel : Codable {
    /* {
      "id": "string",
      "name": "string",
      "description": "string",
      "imgUrl": "string"
    }     DOLDURULARAK YOLLANACAK
     */
    
    let id : String
    let name : String
    let description : String
    let imgUrl : String
    let _id : String

}

class GetProductDetailsModel: Codable {
    
    /*
     "id": String
     
     DOLDURULARAK YOLLANACAK
     */
    let currency : String
    let price : Double
    let id : String
    let name : String
    let description : String
    let imgUrl : String
    
    
    
}


class UpdateProductModel: Codable {
    /*
     "id": "string",
     "name": "string",
     "description": "string",
     "imgUrl": "string"
     DOLDURULARAK YOLLANACAK
     */
    let id : String
    let name : String
    let description : String
    let imgUrl : String
    
}


class DeleteProductModel: Codable {
    /*
     "id": String
     
     DOLDURULARAK YOLLANACAK
     */
    
    let ok : Int
}



//TODO
