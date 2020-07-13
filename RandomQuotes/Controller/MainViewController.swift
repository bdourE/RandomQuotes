//
//  ViewController.swift
//  RandomQuotes
//
//  Created by بدور on 12/07/2020.
//  Copyright © 2020 Bdour. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

// MARK: MainViewController: UIViewController

class MainViewController: UIViewController {

    // MARK: ouetlet

    @IBOutlet weak var QuoteTextView: UITextView!
    @IBOutlet weak var AuthorTextView: UITextView!

    @IBOutlet weak var LikeButton: UIButton!
    @IBOutlet weak var NextButton: UIButton!


    // MARK: proporties
    var newtwork : NetworkManager!
   var dataController:DataController!
    let path = "https://programming-quotes-api.herokuapp.com/quotes/random"
    var QoutesData : [String : String]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //request for qoute and save in history
        newtwork = NetworkManager(dataC : dataController)
        //present the latest qoute
        loadQuetes()
 
  
    }
    
    
    func loadQuetes(){
        
        print("Loading data")
        newtwork.loadJSONFile(url: path, completionBlock: { (success,error,data) -> Void in
            
            // When download completes,control flow goes here.
            if success {
                    self.QoutesData = data
                    if let disc = self.QoutesData["text"] {
                    self.QuoteTextView.text =  " \" \(disc) \" "
                    }
                    self.AuthorTextView.text = self.QoutesData["author"]
                    
                    self.LikeButton.isEnabled = true
                    self.NextButton.isEnabled = true
                        }
            
            else {
                //error in loading json file
                self.QuoteTextView.text =  "Check intenet connection"
            }
        })
        
    }
    
    func resetView()
    {
        LikeButton.setImage(UIImage(named: "emptyHeart.png"), for: .normal)
        LikeButton.isEnabled = false
        NextButton.isEnabled = false
        QuoteTextView.text = "loading"
        AuthorTextView.text = "..."
        print("UI element reset")
    }
    
    @IBAction func addToFavorite(_ sender: Any) {
        
        let Qoute = Favorite(context: self.dataController.viewContext)
        Qoute.author = QoutesData["author"]
        Qoute.quote = QoutesData["text"]
        Qoute.id = QoutesData["id"]
        try? self.dataController.viewContext.save()
        LikeButton.setImage(UIImage(named: "fillHeart.png"), for: .normal)
        print("the data save to favorite list")
        
    }
    
    @IBAction func update(_ sender: Any) {
        
        resetView()
        loadQuetes()
        
    }
    

}
