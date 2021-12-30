//
//  SportEntity+CoreDataProperties.swift
//  SportApp
//
//  Created by admin on 30/12/2021.
//
//

import Foundation
import CoreData


extension SportEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SportEntity> {
        return NSFetchRequest<SportEntity>(entityName: "SportEntity")
    }

    @NSManaged public var name: String?
    @NSManaged public var image: Data?
    @NSManaged public var players: NSSet?

}

// MARK: Generated accessors for players
extension SportEntity {

    @objc(addPlayersObject:)
    @NSManaged public func addToPlayers(_ value: PlayerEntity)

    @objc(removePlayersObject:)
    @NSManaged public func removeFromPlayers(_ value: PlayerEntity)

    @objc(addPlayers:)
    @NSManaged public func addToPlayers(_ values: NSSet)

    @objc(removePlayers:)
    @NSManaged public func removeFromPlayers(_ values: NSSet)

}

extension SportEntity : Identifiable {

}
