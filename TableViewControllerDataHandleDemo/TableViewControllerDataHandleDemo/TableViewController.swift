//
//  TableViewController.swift
//  TableViewControllerDataHandleDemo
//
//  Created by Robert Wong on 8/9/18.
//  Copyright © 2018 Robert Wong. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var firstTableArray: [Test] = []

    @IBAction func dasdasda(_ sender: UIBarButtonItem) {
        let randomNumber = String(Int(arc4random_uniform(101) + 1))
        let newModel = Test(randomInt: randomNumber)
        firstTableArray.append(newModel)
        self.tableView.reloadData()
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let secondTableVC = segue.destination as? SecondTableViewController {
//            secondTableVC.secondTest = 
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        return firstTableArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "testCell", for: indexPath) as! TableViewCell
        cell.testLabel.text = firstTableArray[indexPath.row].randomInt
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(firstTableArray[indexPath.row].randomInt)
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let sample = storyBoard.instantiateViewController(withIdentifier: "SecondTableViewController") as! SecondTableViewController
        print(" what is this 1\(firstTableArray[indexPath.row])")
        sample.secondTest = firstTableArray[indexPath.row]
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
