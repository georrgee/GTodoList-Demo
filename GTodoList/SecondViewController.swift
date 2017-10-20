//
//  SecondViewController.swift
//  GTodoList
//
//  Created by George Garcia on 5/8/17.
//  Copyright © 2017 George. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate{
    
    
    @IBOutlet var itemField: UITextField!
    
    @IBAction func addButton(_ sender: AnyObject) {
        
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        
        var items: [String] // array of strings
        
        if let tempItems = itemsObject as? [String] {
            
            items = tempItems
            items.append(itemField.text!)
            
            print("Item added to list") // printing to console
        }
        else{
            
            items = [itemField.text!]
            print("Item added, i guess...")
            
        }
        
        UserDefaults.standard.set(items, forKey: "items") // save items permanently 
        
        itemField.text = "" // reset the text field be empty
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        // where the user touches outside of the keyboard so that way 
        // the keyboard can be put away
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        
        itemField.resignFirstResponder()
        
        return true
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

