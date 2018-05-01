//
//  Tab1.swift
//  TabBarMVVM
//
//  Created by Eladio Alvarez Valle on 2/19/18.
//  Copyright © 2018 Eladio Alvarez Valle. All rights reserved.
//

import Foundation
import UIKit

class Tab1 : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let viewTab = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "tableViewDescription") as! TableViewDescription
        viewTab.tabType = TabType.ships
        self.addChildViewController(viewTab)
        viewTab.view.frame = self.view.frame
        self.view.addSubview(viewTab.view)
        viewTab.didMove(toParentViewController: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    deinit {
        
    }
}
