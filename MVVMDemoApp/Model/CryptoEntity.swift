//
//  CryptoEntity.swift
//  MVVMDemoApp
//
//  Created by Burak Tunc on 17.01.21.
//

import Foundation

struct CryptoEntity: Decodable {
    let currency : String
    let rate : String
    let timestamp: String
}
