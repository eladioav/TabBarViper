//
//  TableviewDetail.swift
//  TabBarMVVM
//
//  Created by Eladio Alvarez Valle on 2/19/18.
//  Copyright © 2018 Eladio Alvarez Valle. All rights reserved.
//

import Foundation
import UIKit

class TableViewDetail : UIViewController {
    
    @IBOutlet weak var textViewOutlet: UITextView!
    var detailDescription : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        textViewOutlet.text = detailDescription
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
     
        self.navigationController?.popViewController(animated: false)
    }
    
    deinit {
        
    }
}
