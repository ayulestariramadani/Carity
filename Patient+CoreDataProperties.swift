//
//  Patient+CoreDataProperties.swift
//  Carity
//
//  Created by Hanifah BN on 11/06/23.
//
//

import Foundation
import CoreData


extension Patient {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Patient> {
        return NSFetchRequest<Patient>(entityName: "Patient")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var nickname: String?
    @NSManaged public var fullName: String?
    @NSManaged public var birthdate: Date?
    @NSManaged public var disease: String?
    @NSManaged public var briefDescription: String?
    @NSManaged public var height: Int16
    @NSManaged public var weight: Int16
    @NSManaged public var bloodType: String?

}

extension Patient : Identifiable {

}
