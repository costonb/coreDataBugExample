//
//  ViewController.swift
//  CoreDataBug
//
//  Created by Brandon Coston on 9/8/15.
//  Copyright (c) 2015 Test. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let moc = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext!
    
    lazy var fetchController:NSFetchedResultsController = {
        let request = NSFetchRequest(entityName: "Target")
        request.predicate = NSPredicate(format: "SUBQUERY(person.extendedProperties, $extProp, $extProp.name == %@ && $extProp.value == %@).@count > 0", "favorite color", "red")
        request.sortDescriptors = [NSSortDescriptor(key: "targetName", ascending: true)]
        let frc = NSFetchedResultsController(fetchRequest: request, managedObjectContext: self.moc, sectionNameKeyPath: nil, cacheName: nil)
        frc.performFetch(nil)
        return frc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "reuseID")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController : UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.fetchController.sections?.count ?? 0
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let section = self.fetchController.sections?[section] as? NSFetchedResultsSectionInfo {
            let count = section.objects.count
            return count
        }
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseID", forIndexPath: indexPath) as! UITableViewCell
        if let target = self.fetchController.objectAtIndexPath(indexPath) as? Target {
            cell.textLabel?.text = target.targetName
        }
        return cell
    }
}

