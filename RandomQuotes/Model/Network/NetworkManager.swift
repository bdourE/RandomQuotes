//
//  Network.swift
//  RandomQuotes
//
//  Created by بدور on 13/07/2020.
//  Copyright © 2020 Bdour. All rights reserved.
//

import Alamofire
import SwiftyJSON
//
// MARK: - Network
//
class NetworkManager {
    
    
    
    var dataController:DataController!
    
    
    internal typealias RequestCompletion = (Bool, Error? , [String:String]?) -> ()?
    var afManager : SessionManager!
    init(dataC:DataController) {
        dataController = dataC
        let configuration = URLSessionConfiguration.default
        afManager = Alamofire.SessionManager(configuration: configuration)
    }


    
    func loadJSONFile(url :String , completionBlock: @escaping RequestCompletion){


        afManager.request(url, method: .get).validate().responseJSON {
            response in
            switch (response.result) {
                
            case.success(let value) :
                
                print("downloding JSON successd")
                
                let json = JSON(value)
                let Qoute = History(context: self.dataController.viewContext)
                Qoute.author = json["author"].string
                //print(Qoute.author)
                Qoute.quote = json["en"].string
                Qoute.id = json["id"].string
                try? self.dataController.viewContext.save()
                print("the data saved to history list")
                
                let success = true
           
                completionBlock(success, nil , ["author":Qoute.author!  , "text":Qoute.quote! , "id" : Qoute.id!] )
                break
                
            case .failure(let error):
                print("error - > \n    \(error.localizedDescription) \n")
                let success = false
                completionBlock(success, error , nil)
                break
            }
        }
    }
}
    

