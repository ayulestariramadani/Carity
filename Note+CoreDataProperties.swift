//
//  Note+CoreDataProperties.swift
//  Carity
//
//  Created by Hanifah BN on 12/06/23.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var content: String?
    @NSManaged public var recordTime: Date?
    @NSManaged public var recordDate: Date?
    @NSManaged public var labelSFSymbol: String?
    @NSManaged public var labelText: String?
    @NSManaged public var isReminderActive: Bool
    @NSManaged public var reminderTime: Date?
    @NSManaged public var patient: Patient?

    public var wrappedTitle: String {
        title ?? ""
    }
}

extension Note : Identifiable {

}
