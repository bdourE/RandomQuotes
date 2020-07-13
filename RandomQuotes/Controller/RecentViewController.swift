//
//  RecentTableViewController.swift
//  RandomQuotes
//
//  Created by بدور on 13/07/2020.
//  Copyright © 2020 Bdour. All rights reserved.
//

import UIKit

import CoreData

// MARK: RecentViewController: UITabBarController

class RecentViewController: UIViewController {
    
    // MARK: proporties

    var dataController:DataController!
    var quotes : [History] = []

    // MARK: outlet
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let fethRequest : NSFetchRequest<History> = History.fetchRequest()
        if let result = try? dataController.viewContext.fetch(fethRequest){
            quotes = result
        }
        tableView.reloadData()
    }
    
}

// MARK: - UITableViewDataSource
extension RecentViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return quotes.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            
            let Quote = quotes[indexPath.row]
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "RecentTableViewCell", for: indexPath) as! RecentTableViewCell
            
            cell.QText.text = Quote.quote
            
            
            //print(Quote.author)
            return cell
    }
}




