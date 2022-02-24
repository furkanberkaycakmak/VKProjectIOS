//
//  DeleteProductResponseModel.swift
//  VKProject
//
//  Created by Berkay ÇAKMAK on 14.02.2022.
//

import Foundation

struct DeleteProductResponseModel: Codable {
    
    let ok : Int
    
    enum CodingKeys: String, CodingKey {
        case ok
        
    }
}
