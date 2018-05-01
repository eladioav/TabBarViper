//
//  Interactor.swift
//  TabBarMVVM
//
//  Created by Eladio Alvarez Valle on 2/26/18.
//  Copyright © 2018 Eladio Alvarez Valle. All rights reserved.
//

import Foundation

class mainObjectInteractor {
    
    private let mainObjects : [MainObject]
    
    init(mainObjects : [MainObject]) {
        
        self.mainObjects = mainObjects
    }
    
    subscript(index : Int) -> MainObject {
        return mainObjects[index]
    }
    
    func detail(index : Int) -> /*mainObjectDetail*/ String {
    
        return mainObjects[index].details
    }
    
    var count : Int {
        return mainObjects.count
    }
}
