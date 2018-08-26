//
//  Person+CoreDataProperties.swift
//  CoreDataTableViewDemo
//
//  Created by Robert Wong on 8/23/18.
//  Copyright © 2018 Robert Wong. All rights reserved.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var age: Int64
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?

}
