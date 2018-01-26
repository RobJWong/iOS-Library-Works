//
//  ViewController.swift
//  Delegation
//
//  Created by Robert Wong on 1/26/18.
//  Copyright © 2018 Robert Wong. All rights reserved.
//

import UIKit

class FirstVC: UIViewController {
    @IBOutlet weak var stringFromSecondVC: UILabel!
    
    @IBAction func showSecondVC(_ sender: UIButton) {
        let secondVC = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
        secondVC.stringSetupDelegate = self
        present(secondVC, animated: true, completion: nil)
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

extension FirstVC: StringSetupDelegate {
    func textFieldWasFilled(text: String) {
        stringFromSecondVC.text = text
    }
}
