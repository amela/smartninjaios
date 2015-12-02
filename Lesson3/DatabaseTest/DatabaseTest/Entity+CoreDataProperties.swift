//
//  Entity+CoreDataProperties.swift
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

extension Entity {

    @NSManaged var make: String?
    @NSManaged var model: String?
    @NSManaged var owner: NSManagedObject?

}
