//
//  CryptoViewModel.swift
//  MVVMDemoApp
//
//  Created by Burak Tunc on 17.01.21.
//

import Foundation

struct CryptoListViewModel {
    let cryptoCurrencyList : [CryptoEntity]
    func numberOfRowsInSection() -> Int{
        return self.cryptoCurrencyList.count
    }
    
    func cryptoAtIndex(_ index: Int) -> CryptoViewModel {
        let crypto = self.cryptoCurrencyList[index]
        return CryptoViewModel(cryptoEntity: crypto)
    }
}

struct CryptoViewModel {
    let cryptoEntity : CryptoEntity
    
    var name : String {
        return self.cryptoEntity.currency
    }
    
    var rate : String {
        return self.cryptoEntity.rate
    }
    
    var timestamp : String {
        return self.cryptoEntity.timestamp
    }

}
