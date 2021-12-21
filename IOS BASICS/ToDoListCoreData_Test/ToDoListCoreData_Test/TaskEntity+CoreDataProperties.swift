//
//  TaskEntity+CoreDataProperties.swift
//  ToDoListCoreData_Test
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

    @NSManaged public var name: String?

}

extension TaskEntity : Identifiable {

}
