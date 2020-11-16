//
//  Folder+CoreDataProperties.swift
//  Curatio-Todo
//
//  Created by Ashwani Kumar on 2020-11-11.
//
//

import Foundation
import CoreData


extension Folder {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Folder> {
        return NSFetchRequest<Folder>(entityName: "Folder")
    }

    @NSManaged public var name: String?
    @NSManaged public var task: NSSet?

}

// MARK: Generated accessors for task
extension Folder {

    @objc(addTaskObject:)
    @NSManaged public func addToTask(_ value: TodoTask)

    @objc(removeTaskObject:)
    @NSManaged public func removeFromTask(_ value: TodoTask)

    @objc(addTask:)
    @NSManaged public func addToTask(_ values: NSSet)

    @objc(removeTask:)
    @NSManaged public func removeFromTask(_ values: NSSet)

}

extension Folder : Identifiable {

}
