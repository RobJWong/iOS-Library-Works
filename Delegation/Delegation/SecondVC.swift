//
//  SecondVC.swift
//  Delegation
//
//  Created by Robert Wong on 1/26/18.
//  Copyright © 2018 Robert Wong. All rights reserved.
//

import UIKit

protocol StringSetupDelegate {
    func textFieldWasFilled(text: String)
}

class SecondVC: UIViewController {
    
    var stringSetupDelegate : StringSetupDelegate!

    @IBOutlet weak var stringInput: UITextField!
    
    @IBAction func dismissVC(_ sender: UIButton) {
        guard let stringInput = stringInput.text else { return }
        stringSetupDelegate.textFieldWasFilled(text: stringInput)
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
