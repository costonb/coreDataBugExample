//
//  ExtendedProperty.swift
//  CoreDataBug
//
//  Created by Brandon Coston on 9/8/15.
//  Copyright (c) 2015 Test. All rights reserved.
//

import Foundation
import CoreData

class ExtendedProperty: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var value: String
    @NSManaged var people: NSSet

}
