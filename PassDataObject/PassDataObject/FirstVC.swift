//
//  ViewController.swift
//  PassDataObject
//
//  Created by Robert Wong on 1/15/18.
//  Copyright © 2018 Robert Wong. All rights reserved.
//

import UIKit

class FirstVC: UIViewController {
    
    var testObject = TestObject()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        testObject.setup(email: "123@gmail.com", name: "Test")
        print(testObject.email)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "secondVC" {
            //let sendingVC: SendingViewController = segue.destination as! SendingViewController
            let secondVC = segue.destination as! SecondVC
            secondVC.testObjectContainer = testObject
        }
    }
}

