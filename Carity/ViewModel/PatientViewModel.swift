//
//  PatientViewModel.swift
//  CarityCore
//
//  Created by Hanifah BN on 08/06/23.
//

import Foundation
import CoreData

class PatientViewModel: ObservableObject {
    private let viewContext = PersistenceController.shared.viewContext
    private var stack = CoreDataStack.shared.context
    
    @Published var patientList: [Patient] = []
    
    @Published var selectedPatient: Patient? {
        didSet {
            fetchPatientData()
        }
    }
    
    @Published var patient: Patient?
    
    init() {
        fetchPatientData()
    }
    
    func fetchPatientData() {
        let request = NSFetchRequest<Patient>(entityName: "Patient")
        
        do {
            patientList = try stack.fetch(request)
        }catch {
            print("DEBUG: Some error occured while fetching")
        }
    }
    
    func addPatient(nickname: String, fullName: String, birthdate: Date, disease: String, briefDescription: String, height: Int, weight: Int, bloodType: String) {
        let patient = Patient(context: stack)
        patient.id = UUID()
        patient.nickname = nickname
        patient.fullName = fullName
        patient.birthdate = birthdate
        patient.disease = disease
        patient.briefDescription = briefDescription
        patient.height = Int16(height)
        patient.weight = Int16(weight)
        patient.bloodType = bloodType
        
        save()
        self.fetchPatientData()
        print("dah save patient")
    }
    
    func deletePatient(patient: Patient) {
        stack.delete(patient)
        save()
        fetchPatientData()
    }
    
    func updatePatient(patient: Patient) {
        save()
        fetchPatientData()
    }
    
    func save() {
        do {
            try stack.save()
        }catch {
            print("Error saving")
        }
    }
}
