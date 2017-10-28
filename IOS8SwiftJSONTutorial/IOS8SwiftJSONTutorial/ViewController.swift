//
//  ViewController.swift
//  IOS8SwiftJSONTutorial
//
//  Created by Arthur Knopper on 18/08/14.
//  Copyright (c) 2014 Arthur Knopper. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1
        let urlAsString = "http://date.jsontest.com"
        let url = URL(string: urlAsString)!
        let urlSession = URLSession.shared
        
        //2
        let jsonQuery = urlSession.dataTask(with: url) { (data, response, error) in
            if (error != nil) {
                print(error!.localizedDescription)
            }
            
            // 3
            var jsonResult = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
            if (jsonResult == nil) {
                print("JSON Error")
            }
            
            // 4
            let jsonDate: String! = jsonResult!["date"] as! String
            let jsonTime: String! = jsonResult!["time"] as! String
            
            DispatchQueue.main.async {
                self.dateLabel.text = jsonDate
                self.timeLabel.text = jsonTime
            }
        }
        
        // 5
        jsonQuery.resume()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

