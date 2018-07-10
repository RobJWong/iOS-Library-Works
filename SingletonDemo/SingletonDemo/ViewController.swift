//
//  ViewController.swift
//  SingletonDemo
//
//  Created by Robert Wong on 6/20/18.
//  Copyright © 2018 Robert Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

class DataModel {
    
    static var sharedInstance = DataModel()
    
    private init() {
        didSet {
            
        }
        
    }
    
    private (set) var data: String?
    
    func requestData() {
        self.data = "Data from wherever"
    }
}

