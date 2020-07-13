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


class MainViewController: UIViewController {

    @IBOutlet weak var QuoteTextView: UITextView!
    @IBOutlet weak var AuthorTextView: UITextView!

    @IBOutlet weak var LikeButton: UIButton!
    @IBOutlet weak var NextButton: UIButton!


    //var Qoute : History?
    
    var newtwork : NetworkManager!

   var dataController:DataController!

    let path = "https://programming-quotes-api.herokuapp.com/quotes/random"

    var QoutesData : [String : String]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newtwork = NetworkManager(dataC : dataController)
        loadQuetes()
 
    }
    
    
    func loadQuetes(){
        
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
                
                // download fail
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
    }
    
    @IBAction func addToFavorite(_ sender: Any) {
        
        let Qoute = Favorite(context: self.dataController.viewContext)
        Qoute.author = QoutesData["author"]
        Qoute.quote = QoutesData["text"]
        Qoute.id = QoutesData["id"]
        try? self.dataController.viewContext.save()
        
        LikeButton.setImage(UIImage(named: "fillHeart.png"), for: .normal)

        
        
        
        
    }
    
    @IBAction func update(_ sender: Any) {
        resetView()
        loadQuetes()
        
    }
    

}
