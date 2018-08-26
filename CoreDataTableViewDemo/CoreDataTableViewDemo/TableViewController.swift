//
//  TableViewController.swift
//  CoreDataTableViewDemo
//
//  Created by Robert Wong on 8/23/18.
//  Copyright © 2018 Robert Wong. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {

    let firstNames = ["Jane", "John", "Stephen", "Stacy", "Taylor", "Alex", "Eren"]
    let lastNames = ["White", "Black", "Fox", "Jones", "King", "McQueen", "Yeager"]
    let ages = [25, 26, 20, 30, 27, 28, 23]
    //var people = [NSManagedObject]()
    var people = [Person]()
    var fetchedResultsController: NSFetchedResultsController<Person> = NSFetchedResultsController()

    
    @IBAction func addButtonWasTapped(_ sender: UIBarButtonItem) {
        let randomFirstName = firstNames[Int(arc4random_uniform(UInt32(firstNames.count)))]
        let randomLastName = lastNames[Int(arc4random_uniform(UInt32(lastNames.count)))]
        let randomAge = ages[Int(arc4random_uniform(UInt32(ages.count)))]
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Person", in: context)
        
        //let person = NSManagedObject(entity: entity!, insertInto: context)
        let person = Person(entity: entity!, insertInto: context)
        person.setValue(randomFirstName, forKey: "firstName")
        person.setValue(randomLastName, forKey: "lastName")
        person.setValue(randomAge, forKey: "age")
        appDelegate.saveContext()
        people.append(person)
        
        self.tableView.reloadData()
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let newIndex = indexPath.row
//        let selectedRow = people[indexPath.row]
//        tableView.deselectRow(at: indexPath, animated: true)
//        performSegue(withIdentifier: "SegueListDetail", sender: selectedRow)
//    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
//    {
//        if let vc = segue.destination as? ChangeViewController {
//            vc.listEntry = sender as! Person
//        }
//        if segue.identifier == "SegueListDetail" {
//            guard let navigationController = segue.destination as? UINavigationController,
//                let detailViewController = navigationController.topViewController as? ChangeViewController,
//                //let indexPath = tableView.indexPathForSelectedRow else {
//                    fatalError("Application storyboard mis-configuration")
//            }
//            // 3
//            let listEntry = fetchedResultsController.object(at: indexPath)
//            print("dasdas \(listEntry)")
//            // 4
//            detailViewController.listEntry = listEntry
//            detailViewController.context = listEntry.managedObjectContext
//            detailViewController.delegate = self
//        }
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
        
        do {
            let results = try managedContext.fetch(fetchRequest)
            //people = results as! [NSManagedObject]
            people = results as! [Person]
        } catch let error as NSError {
            print("Fetching Error: \(error.userInfo)")
        }
    }
    
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
        return people.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let person = people[indexPath.row]
//        let firstName = person.value(forKey: "firstName")
//        let lastName = person.value(forKey: "lastName")
//        let age = person.value(forKey: "age")
        let firstName = person.firstName
        let lastName = person.lastName
        let age = person.age
        cell.textLabel?.text = "\(firstName!) \(lastName!) age \(age)"
        
        return cell
    }

}

//extension TableViewController: PersonEntryDelegate {
//    func didFinish(viewController: ChangeViewController, didSave: Bool) {
//
//        guard didSave,
//            let context = viewController.context,
//            context.hasChanges else {
//                dismiss(animated: true)
//                return
//        }
//
//        context.perform {
//            do {
//                try context.save()
//            } catch let error as NSError {
//                fatalError("Error: \(error.localizedDescription)")
//            }
////            let entity = NSEntityDescription.entity(forEntityName: "Person", in: context)
////            let person = Person(entity: entity!, insertInto: context)
////            person.setValue(randomFirstName, forKey: "firstName")
////            person.setValue(randomLastName, forKey: "lastName")
////            person.setValue(randomAge, forKey: "age")
////            appDelegate.saveContext()
////            people.append(person)
//
//            self.tableView.reloadData()
//        }
//
//        dismiss(animated: true)
//    }
//}
