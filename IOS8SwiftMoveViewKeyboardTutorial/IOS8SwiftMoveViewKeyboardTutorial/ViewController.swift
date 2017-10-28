//
//  ViewController.swift
//  IOS8SwiftMoveViewKeyboardTutorial
//
//  Created by Arthur Knopper on 23/08/14.
//  Copyright (c) 2014 Arthur Knopper. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var textField: UITextField!
   
    var kbHeight: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
    }
   
    func animateTextField(up: Bool) {
        let movement = (up ? -kbHeight : kbHeight)

        UIView.animate(withDuration: 0.3, animations: {
            self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement!)
        })
    }
  
    override func viewWillAppear(_ animated:Bool) {
        super.viewWillAppear(animated)
    
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
  
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    
        NotificationCenter.default.removeObserver(self)
  }
  
    @objc func keyboardWillShow(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            if let keyboardSize = (userInfo[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                kbHeight = keyboardSize.height
                self.animateTextField(up: true)
            }
    
        }
  
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        self.animateTextField(up: false)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

