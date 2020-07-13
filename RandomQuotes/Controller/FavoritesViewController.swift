//
//  File.swift
//  RandomQuotes
//
//  Created by بدور on 12/07/2020.
//  Copyright © 2020 Bdour. All rights reserved.
//

import UIKit
import CoreData

// MARK: FavoritesViewController: UIViewController

class FavoritesViewController: UIViewController {
    
    // MARK: Outlets

    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Outlets
    
    var dataController:DataController!
    var quotes : [Favorite] = []
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let fethRequest : NSFetchRequest<Favorite> = Favorite.fetchRequest()
        if let result = try? dataController.viewContext.fetch(fethRequest){
            quotes = result
        }
        tableView.reloadData()
    }
    
    
    
}

// MARK: - UITableViewDataSource
extension FavoritesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return quotes.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            
            let Quote = quotes[indexPath.row]
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "FavTableViewCell", for: indexPath) as! FavoriteTableViewCell
            cell.QText.text = Quote.quote
            cell.BGview.backgroundColor = .random()

            //print(Quote.author)
            return cell
    }
}



