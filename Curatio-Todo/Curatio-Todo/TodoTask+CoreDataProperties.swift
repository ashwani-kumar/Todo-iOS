//
//  TodoTask+CoreDataProperties.swift
//  Curatio-Todo
//
//  Created by Ashwani Kumar on 2020-11-11.
//
//

import Foundation
import CoreData


extension TodoTask {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TodoTask> {
        return NSFetchRequest<TodoTask>(entityName: "TodoTask")
    }

    @NSManaged public var complete: Bool
    @NSManaged public var id: String?
    @NSManaged public var title: String?
    @NSManaged public var origion: Folder?

}

extension TodoTask : Identifiable {

}
