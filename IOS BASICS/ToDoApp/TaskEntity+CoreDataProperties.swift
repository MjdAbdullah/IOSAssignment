//
//  TaskEntity+CoreDataProperties.swift
//  ToDoApp
//
//  Created by admin on 21/12/2021.
//
//

import Foundation
import CoreData


extension TaskEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TaskEntity> {
        return NSFetchRequest<TaskEntity>(entityName: "TaskEntity")
    }

    @NSManaged public var title: String?
    @NSManaged public var descrption: String?
    @NSManaged public var date: Date?
    @NSManaged public var done: Bool

}

extension TaskEntity : Identifiable {

}
