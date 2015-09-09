//
//  Target.swift
//  CoreDataBug
//
//  Created by Brandon Coston on 9/8/15.
//  Copyright (c) 2015 Test. All rights reserved.
//

import Foundation
import CoreData

class Target: NSManagedObject {

    @NSManaged var targetName: String
    @NSManaged var person: Person

}
