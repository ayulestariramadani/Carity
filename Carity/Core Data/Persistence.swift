//
//  Persistence.swift
//  CarityCore
//
//  Created by Hanifah BN on 08/06/23.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    let container: NSPersistentContainer
    
    var viewContext: NSManagedObjectContext {
        return container.viewContext
    }

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "CarityModel")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
//        seedInitialData()
    }
    
//    func seedInitialData() {
//        let context = container.viewContext
//
//        // Check if categories already exist
//        let fetchRequestGeneral: NSFetchRequest<GeneralCategory> = GeneralCategory.fetchRequest()
//        fetchRequestGeneral.fetchLimit = 1
//
//        do {
//            let count = try context.count(for: fetchRequestGeneral)
//            guard count == 0 else {
//                // Categories already seeded
//                return
//            }
//        } catch {
//            print("Error fetching categories: \(error)")
//            return
//        }
//
//        // Seed general categories
//        let treatmentCategory = GeneralCategory.createGeneralCategory(name: "Treatment", context: context)
//        let assessmentCategory = GeneralCategory.createGeneralCategory(name: "Assessment", context: context)
//
//        // Seed specific categories for "Treatment"
//        SpecificCategory.createSpecificCategory(name: "Medications", generalCategory: treatmentCategory, context: context)
//        SpecificCategory.createSpecificCategory(name: "Food and Nutrition", generalCategory: treatmentCategory, context: context)
//
//        // Seed specific categories for "Assessment"
//        SpecificCategory.createSpecificCategory(name: "Consultation Sessions", generalCategory: assessmentCategory, context: context)
//        SpecificCategory.createSpecificCategory(name: "Clinical Documents", generalCategory: assessmentCategory, context: context)
//
//        // Save the changes
//        saveContext()
//    }
//
//    func saveContext() {
//        let context = container.viewContext
//        if context.hasChanges {
//            do {
//                try context.save()
//            } catch {
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
}

//extension GeneralCategory {
//    static func createGeneralCategory(name: String, context: NSManagedObjectContext) -> GeneralCategory {
//        let generalCategory = GeneralCategory(context: context)
//        generalCategory.name = name
//        return generalCategory
//    }
//}
//
//extension SpecificCategory {
//    static func createSpecificCategory(name: String, generalCategory: GeneralCategory, context: NSManagedObjectContext) {
//        let specificCategory = SpecificCategory(context: context)
//        specificCategory.name = name
//        specificCategory.generalName = generalCategory
//    }
//}
