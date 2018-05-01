//
//  mainObjectPresenter.swift
//  TabBarMVVM
//
//  Created by Eladio Alvarez Valle on 2/26/18.
//  Copyright © 2018 Eladio Alvarez Valle. All rights reserved.
//

import Foundation
import UIKit

class mainObjectPresenter {
    
    let interactor : mainObjectInteractor
    
    init(interactor : mainObjectInteractor) {
        
        self.interactor = interactor
    }
    
    func configure(cell : UITableViewCell , index : Int) -> UITableViewCell {
        
        cell.textLabel?.text = interactor[index].name
        cell.detailTextLabel?.text = interactor[index].description
        
        return cell
    }
    
    func getDetail(index : Int) -> String {
    
        return interactor[index].description
    }
    
    var sections : Int {
        return 1
    }
    
    var count : Int {
        return interactor.count
    }
}
