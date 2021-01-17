//
//  ViewController.swift
//  MVVMDemoApp
//
//  Created by Burak Tunc on 17.01.21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    private var cryptoListViewModel: CryptoListViewModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        //3152da2ef1f254b71027175716158175
        getData()
        
    }
    
    func getData(){
        let url = URL(string:"https://api.nomics.com/v1/exchange-rates?key=demo-26240835858194712a4f8cc0dc635c7a")!
        Webservice().downloadCurencies(url: url) { result in
            if let result = result {
                self.cryptoListViewModel = CryptoListViewModel(cryptoCurrencyList: result)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }
        }
    }
    
    func configureUI(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel?.numberOfRowsInSection() as! Int
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath) as! TableViewCell
        let cryptoViewModel = self.cryptoListViewModel.cryptoAtIndex(indexPath.row)
        cell.currencyName.text = cryptoViewModel.name
        cell.rateLabel.text = cryptoViewModel.rate
        cell.timestampLabel.text = cryptoViewModel.timestamp
        return cell
    }


}

