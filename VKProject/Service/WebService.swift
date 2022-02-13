//
//  webService.swift
//  VKProject
//
//  Created by Berkay ÇAKMAK on 10.02.2022.
//
//
//

import Foundation

class Webservice {
    
    func getProduct(url: URL, completion: @escaping ([GetProductModel]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                
                let productList = try? JSONDecoder().decode([GetProductModel].self, from: data)
                //print(productList)
                
                if let productList = productList {
                    completion(productList)
                    
                    
                    
                }
            }
        }.resume()
    }
}


