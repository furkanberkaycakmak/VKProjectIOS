//
//  GetProductDetailsResponseModel.swift
//  VKProject
//
//  Created by Berkay ÇAKMAK on 14.02.2022.
//

import Foundation

class GetProductDetailsResponseModel: Codable {
    
    let currency : String
    let price : Double
    let id : String
    let name : String
    let description : String
    let imgUrl : String
}
