//
//  PlayerEntity+CoreDataProperties.swift
//  SportApp
//
//  Created by admin on 30/12/2021.
//
//

import Foundation
import CoreData


extension PlayerEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PlayerEntity> {
        return NSFetchRequest<PlayerEntity>(entityName: "PlayerEntity")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: String?
    @NSManaged public var hight: String?
    @NSManaged public var doSport: SportEntity?

}

extension PlayerEntity : Identifiable {

}
