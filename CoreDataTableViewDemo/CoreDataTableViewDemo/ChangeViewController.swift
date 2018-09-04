//
//  ChangeViewController.swift
//  CoreDataTableViewDemo
//
//  Created by Robert Wong on 8/25/18.
//  Copyright © 2018 Robert Wong. All rights reserved.
//

import UIKit
import CoreData

protocol PersonEntryDelegate {
    func didFinish(viewController: ChangeViewController, didSave: Bool)
}

class ChangeViewController: UIViewController {
    
    @IBOutlet weak var dataTextField: UITextField!
    
    var listEntry: Person?
    var context: NSManagedObjectContext!
    var delegate: PersonEntryDelegate?
    
    @IBAction func saveData(_ sender: UIButton) {
        updateData()
        delegate?.didFinish(viewController: self, didSave: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(listEntry?.age)
        configureView()
    }
    
    func configureView() {
        guard let dataEntry = listEntry else { return }
        dataTextField.text = dataEntry.firstName
    }
    
    func updateData() {
        guard let entry = listEntry else { return }
        entry.firstName = dataTextField.text
    }

}
