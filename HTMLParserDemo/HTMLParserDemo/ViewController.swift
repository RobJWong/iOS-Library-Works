//
//  ViewController.swift
//  HTMLParserDemo
//
//  Created by Robert Wong on 6/2/18.
//  Copyright © 2018 Robert Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let HTMLCall = HTMLGet()
        HTMLCall.getBookTitle(isbn: "9780393347777") { response in
            print("reponse:", response)
        }
        //print(HTMLGet.getBookTitle(9780393347777))
        //9780393347777
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

