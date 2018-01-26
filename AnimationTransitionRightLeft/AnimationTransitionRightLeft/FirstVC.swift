//
//  FirstViewController.swift
//
//
//  Created by Robert Wong on 1/25/18.
//

import UIKit

class FirstVC: UIViewController {
    
    let transition = AnimatorTransition()
    
    @IBAction func nextScreen(_ sender: UIButton) {
        let nextScreen = storyboard!.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
        nextScreen.transitioningDelegate = self
        present(nextScreen, animated: true, completion: nil)
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return nil
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

extension FirstVC: UIViewControllerTransitioningDelegate {
    
}

