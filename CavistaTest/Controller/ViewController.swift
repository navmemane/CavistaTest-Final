//
//  ViewController.swift
//  CavistaTest
//
//  Created by apple on 31/07/20.
//  Copyright © 2020 Proximate. All rights reserved.
//

import UIKit
import SnapKit
import Alamofire

class ViewController: UIViewController {

    let tableView = UITableView()
    var dataTypes = [DataType]()
    var safeArea : UILayoutGuide!

    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
       

        DataAPI.getData(urlString: "https://raw.githubusercontent.com/AxxessTech/Mobile-Projects/master/challenge.json",completion: { (DataType) in
            self.dataTypes = DataType
            self.tableView.reloadData()
            })
        
        setUpTableView()

    }
    

    func setUpTableView(){
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(safeArea)
            make.left.equalTo(self.view)
            make.right.equalTo(self.view)
            make.bottom.equalTo(safeArea)
            
        }
        
   }

}

extension ViewController : UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
              return dataTypes.count
          }
          
          func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
           var cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier")
           if cell == nil {
               cell = UITableViewCell(style: .value1, reuseIdentifier: "reuseIdentifier")
           }
           
           cell?.textLabel?.text = "ID \(dataTypes[indexPath.row].id ?? "_")"
           cell?.detailTextLabel?.text = dataTypes[indexPath.row].date
           
           return cell!
          }
       
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           let detailView = DetailViewController()
           detailView.detailDataTypes = dataTypes[indexPath.row]
           self.present(detailView, animated: true, completion: nil)
       }
}

