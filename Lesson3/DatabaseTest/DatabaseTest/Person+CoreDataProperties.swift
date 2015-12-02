//
//  Person+CoreDataProperties.swift
//  DatabaseTest
//
//  Created by amela on 30/11/15.
//  Copyright © 2015 amela. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Person {

    @NSManaged var birthday: NSDate?
    @NSManaged var name: String?
    @NSManaged var cars: NSSet?

}
