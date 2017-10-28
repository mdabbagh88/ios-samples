//
//  TableViewController.swift
//  IOS8SwiftPropertyListTutorial
//
//  Created by Arthur Knopper on 01/05/15.
//  Copyright (c) 2015 Arthur Knopper. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var tableData = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        let path = Bundle.main.path(forResource: "TableData", ofType: "plist")
        let dict = NSDictionary(contentsOfFile: path!)
        
        tableData = dict!.object(forKey: "AppleDevice") as! [String]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return tableData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        cell.textLabel!.text = tableData[indexPath.row]

        return cell
    }
}
