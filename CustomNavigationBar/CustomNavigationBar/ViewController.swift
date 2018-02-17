//
//  ViewController.swift
//  CustomNavigationBar
//
//  Created by Robert Wong on 2/16/18.
//  Copyright © 2018 Robert Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupNavBarItems()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupNavBarItems() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        
        //let backButton = UIButton(type: .system)
        //backButton.setImage(#imageLiteral(resourceName: "icon_back"), for: .normal)
        //navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
    }

}

