//
//  ViewController.swift
//  IOS8SwiftFileManagementTutorial
//
//  Created by Arthur Knopper on 03/03/15.
//  Copyright (c) 2015 Arthur Knopper. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var fileManager = FileManager()
    var tmpDir: String = NSTemporaryDirectory()
    let fileName = "sample.txt"

    @IBAction func createFile(sender: AnyObject) {
        let path = tmpDir.appending(fileName)
        let contentsOfFile = "Sample Text"
        
        // Write File
        if ((try? contentsOfFile.write(toFile: path, atomically: true, encoding: .utf8)) != nil) {
            if let errorMessage = error {
                print("Failed to create file")
                print("\(errorMessage)")
            }
        } else {
            print("File sample.txt created at tmp directory")
        }
    }
    
    @IBAction func listDirectory(sender: AnyObject) {
        // List Content of Path
        let isFileInDir = enumerateDirectory() ?? "Empty"
        print("Contents of Directory =  \(isFileInDir)")
    }
    
    @IBAction func viewFileContent(sender: AnyObject) {
        let isFileInDir = enumerateDirectory() ?? ""
        
        let path = tmpDir.appending(isFileInDir)
        let contentsOfFile = try? String(contentsOfFile: path, encoding: String.Encoding.utf8)
        
        if let content = contentsOfFile {
            print("Content of file = \(content)")
        } else {
            print("No file found")
        }
    }
    
    @IBAction func deleteFile(sender: AnyObject) {
        if let isFileInDir = enumerateDirectory() {
            let path = tmpDir.appending(isFileInDir)
            try? fileManager.removeItem(atPath: path)
        } else {
            print("No file found")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func enumerateDirectory() -> String? {
        
        let filesInDirectory = try? fileManager.contentsOfDirectory(atPath: tmpDir)
        
        if let files = filesInDirectory {
            if files.count > 0 {
                if files[0] == fileName {
                    print("sample.txt found")
                    return files[0]
                } else {
                    print("File not found")
                    return nil
                }
            }
        }
        return nil
     }
}

