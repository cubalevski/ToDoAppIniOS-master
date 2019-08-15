//
//  Tasks+CoreDataProperties.swift
//  ToDoPro
//
//  Created by Simon Cubalevski on 6/20/19.
//  Copyright © 2019 Simon Cubalevski. All rights reserved.
//
//

import Foundation
import CoreData


extension Tasks {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tasks> {
        return NSFetchRequest<Tasks>(entityName: "Tasks")
    }

    @NSManaged public var taskId: String?
    @NSManaged public var taskName: String?
    @NSManaged public var status: Bool
    @NSManaged public var taskCategory: TaskCategory?

}
