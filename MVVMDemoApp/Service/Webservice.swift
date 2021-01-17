//
//  Webservice.swift
//  MVVMDemoApp
//
//  Created by Burak Tunc on 17.01.21.
//

import Foundation

class Webservice {
    func downloadCurencies(url: URL, completion: @escaping([CryptoEntity]?)->()){
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                let cryptoList = try? JSONDecoder().decode([CryptoEntity].self, from: data)
                
                if let cryptoList = cryptoList {
                    completion(cryptoList)
                }
            }
        }.resume()
        
    }
}
