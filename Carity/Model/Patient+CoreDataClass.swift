//
//  Patient+CoreDataClass.swift
//  Carity
//
//  Created by Hanifah BN on 12/06/23.
//
//

import Foundation
import CoreData

@objc(Patient)
public class Patient: NSManagedObject {

    convenience init(context: NSManagedObjectContext) {
        let entity = NSEntityDescription.entity(forEntityName: "Patient", in: context)!
        self.init(entity: entity, insertInto: context)
        
        self.nickname = ""
        self.fullName = ""
        self.birthdate = Date.now
        self.briefDescription = ""
        self.height = 0
        self.weight = 0
        self.bloodType = ""
        self.disease = ""
    }
}
