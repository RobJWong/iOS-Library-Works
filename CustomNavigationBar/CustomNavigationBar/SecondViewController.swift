//
//  SecondViewController.swift
//  CustomNavigationBar
//
//  Created by Robert Wong on 2/16/18.
//  Copyright © 2018 Robert Wong. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        
        let backButton = UIBarButtonItem(image:UIImage(named:"icon_back"), style:.plain, target:self, action:#selector(SecondViewController.buttonAction(_:)))
        //backButton.tintColor = UIColor.white
        self.navigationItem.leftBarButtonItem = backButton
        
        //let backBarButton = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(backButtonTapped(sender:))) as UIBarButtonItem
        
//        let backButton = UIButton(type: .system)
//        backButton.setImage(#imageLiteral(resourceName: "icon_back"), for: .normal)
//        let backBarButton = UIBarButtonItem.init(customView: backButton)
//        navigationItem.setLeftBarButton(backBarButton, animated: true)
        
//        let backButton = UIButton(type: .system)
//        backButton.setImage(#imageLiteral(resourceName: "icon_back"), for: .normal)
//        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
    }
        
//        let backBarButton = UIBarButtonItem.init(barButtonSystemItem: .sy, target: self, action: #selector(backButtonTapped(sender:))) as UIBarButtonItem
//
//        navigationItem.setLeftBarButton(backBarButton, animated: true)
//    }
    
    @objc func buttonAction(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
