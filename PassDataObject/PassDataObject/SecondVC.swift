//
//  SecondVC.swift
//  PassDataObject
//
//  Created by Robert Wong on 1/15/18.
//  Copyright © 2018 Robert Wong. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {
    
    var testObjectContainer : TestObject?

    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        emailLabel.text = testObjectContainer?.email
        nameLabel.text = testObjectContainer?.name
        testObjectContainer?.secondVCData = "TEST TEST"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "thirdVC" {
            //let sendingVC: SendingViewController = segue.destination as! SendingViewController
            let thirdVC = segue.destination as! ThirdVC
            thirdVC.testObjectContainer = testObjectContainer
        }
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
