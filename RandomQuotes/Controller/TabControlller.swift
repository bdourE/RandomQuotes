//
//  File.swift
//  RandomQuotes
//
//  Created by بدور on 13/07/2020.
//  Copyright © 2020 Bdour. All rights reserved.
//

import UIKit

class TabControlller : UITabBarController {
    
    var dataController:DataController!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    
    override func viewDidLoad() {
        
        dataController = appDelegate.dataController
        
        
        let views = self.viewControllers!
        
        let mainView = views[0]  as! MainViewController
        mainView.dataController =  self.dataController
        
        let favView = views[1]  as! FavoritesViewController
        favView.dataController =  self.dataController
        
        let recView = views[2]  as! RecentViewController
        recView.dataController =  self.dataController
        
        
        
    }
}
