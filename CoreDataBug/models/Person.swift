//
//  Person.swift
//  CoreDataBug
//
//  Created by Brandon Coston on 9/8/15.
//  Copyright (c) 2015 Test. All rights reserved.
//

import Foundation
import CoreData

class Person: NSManagedObject {

    @NSManaged var firstName: String
    @NSManaged var targets: NSSet
    @NSManaged var extendedProperties: NSSet

}
