//
//  TableviewDescription.swift
//  TabBarMVVM
//
//  Created by Eladio Alvarez Valle on 2/19/18.
//  Copyright © 2018 Eladio Alvarez Valle. All rights reserved.
//

import Foundation
import UIKit

class TableViewDescription : UITableViewController {
    
    var tabType : TabType?
    var presenter : mainObjectPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let tabType_ = tabType {
            print(tabType_.rawValue)
            getJSONDecodable(type: tabType_)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellDescription", for: indexPath)
        return (self.presenter?.configure(cell: cell, index: indexPath.row))!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let detail = self.presenter?.getDetail(index: indexPath.row) else {
            return
        }
        
        let viewDetail = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "tableViewDetail") as! TableViewDetail
        viewDetail.detailDescription = detail
        
        if let nav = self.navigationController
        {
        
            nav.pushViewController(viewDetail, animated: false)
        } else{
            
             self.addChildViewController(viewDetail)
             viewDetail.view.frame = self.view.frame
             self.view.addSubview(viewDetail.view)
             viewDetail.didMove(toParentViewController: self)
        }
        
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return self.presenter?.sections ?? 0
    }
    
    func getJSONData(type : TabType) {
        print("Get JSON : \(type)")
        DispatchQueue.global(qos: .userInitiated).async {
            
            // read the json file
            if let url = Bundle.main.url(forResource: type.rawValue, withExtension: "json"),
                let data = try? Data(contentsOf: url),
                let json = try? JSONSerialization.jsonObject(with: data, options: []) as? JSONArray,
                let mainObject = try? decode(books: json){
                
                print("Get JSON2")
                let interactor : mainObjectInteractor = mainObjectInteractor(mainObjects: mainObject)
                self.presenter = mainObjectPresenter(interactor: interactor)
                
                 DispatchQueue.main.async {
                    
                    self.tableView.reloadData()
                    print("Get JSON3")
                }
                
            }else{
                // Something went really wrong with the JSON file
                fatalError("JSON parsing went south. Better luck next time! ;-)")
            }

        }
    }
    
    func getJSONDecodable(type : TabType) {
        
        print("Get JSONDecodable : \(type)")
        DispatchQueue.global(qos: .userInitiated).async {
            
            // read the json file
            if let url = Bundle.main.url(forResource: type.rawValue, withExtension: "json"),
                let data = try? Data(contentsOf: url, options: NSData.ReadingOptions.alwaysMapped) {

                    let decoder = JSONDecoder()

                    do {
                    
                        let mainObjects = try decoder.decode([MainObject].self, from: data)

                        let interactor : mainObjectInteractor = mainObjectInteractor(mainObjects: mainObjects)
                        self.presenter = mainObjectPresenter(interactor: interactor)
                
                        DispatchQueue.main.async {

                            self.tableView.reloadData()
                        }
                    
                    } catch let error {
                        print(error)
                    }
                
            }else{
                // Something went really wrong with the JSON file
                fatalError("JSON parsing went south. Better luck next time! ;-)")
            }
            
        }
    }
}
