//
//  ViewController.swift
//  IOS8SwiftActionSheetTutorial
//
//  Created by Arthur Knopper on 16/10/14.
//  Copyright (c) 2014 Arthur Knopper. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBAction func showActionSheet(sender: AnyObject) {
    // 1
    let optionMenu = UIAlertController(title: nil, message: "Choose Option", preferredStyle: .actionSheet)
    
    // 2
    let deleteAction = UIAlertAction(title: "Delete", style: .default, handler: {
      (alert: UIAlertAction!) -> Void in
      print("File Deleted")
    })
    let saveAction = UIAlertAction(title: "Save", style: .default, handler: {
      (alert: UIAlertAction!) -> Void in
      print("File Saved")
    })
    
    //
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
      (alert: UIAlertAction!) -> Void in
      print("Cancelled")
    })
    
    
    // 4
    optionMenu.addAction(deleteAction)
    optionMenu.addAction(saveAction)
    optionMenu.addAction(cancelAction)
    
    // 5
    self.present(optionMenu, animated: true, completion: nil)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

