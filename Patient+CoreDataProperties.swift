//
//  Patient+CoreDataProperties.swift
//  Carity
//
//  Created by Hanifah BN on 12/06/23.
//
//

import Foundation
import CoreData


extension Patient {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Patient> {
        return NSFetchRequest<Patient>(entityName: "Patient")
    }

    @NSManaged public var birthdate: Date?
    @NSManaged public var bloodType: String?
    @NSManaged public var briefDescription: String?
    @NSManaged public var disease: String?
    @NSManaged public var fullName: String?
    @NSManaged public var height: Int16
    @NSManaged public var id: UUID?
    @NSManaged public var nickname: String?
    @NSManaged public var weight: Int16
    @NSManaged public var notes: NSSet?
    
    public var noteList: [Note] {
        let noteSet = notes as? Set<Note> ?? []
        return noteSet.sorted {
            $0.wrappedTitle < $1.wrappedTitle
        }
    }

}

// MARK: Generated accessors for notes
extension Patient {

    @objc(addNotesObject:)
    @NSManaged public func addToNotes(_ value: Note)

    @objc(removeNotesObject:)
    @NSManaged public func removeFromNotes(_ value: Note)

    @objc(addNotes:)
    @NSManaged public func addToNotes(_ values: NSSet)

    @objc(removeNotes:)
    @NSManaged public func removeFromNotes(_ values: NSSet)

}

extension Patient : Identifiable {

}
