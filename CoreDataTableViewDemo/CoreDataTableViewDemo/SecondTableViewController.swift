//
//  SecondTableViewController.swift
//  CoreDataTableViewDemo
//
//  Created by Robert Wong on 8/24/18.
//  Copyright © 2018 Robert Wong. All rights reserved.
//

import UIKit
import CoreData

protocol PersonEntryDelegate {
    func didFinish(viewController: SecondTableViewController, didSave: Bool)
}

class SecondTableViewController: UITableViewController {

    @IBOutlet weak var dataLabel: UITextField!
    
    var listEntry: Person?
    var context: NSManagedObjectContext!
    var delegate:PersonEntryDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }


}
