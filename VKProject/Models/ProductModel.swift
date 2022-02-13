//
//  productModel.swift
//  VKProject
//
//  Created by Berkay ÇAKMAK on 10.02.2022.
// MODELLER AYRI SWİFT DOSYASINA YAZILACAK, PSOT PRODUCT GİBİ.

// nsobject kullanılabilir.

// moya kullanılacak.
// pods

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


class GetProductDetailsRequestModel: Codable {
    
    /*
     "id": String
     
     DOLDURULARAK YOLLANACAK
     */
}

class GetProductDetailsResponseModel: Codable {
    
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
