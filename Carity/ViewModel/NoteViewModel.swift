//
//  NoteViewModel.swift
//  Carity
//
//  Created by Hanifah BN on 12/06/23.
//

import Foundation
import CoreData

class NoteViewModel: ObservableObject {
    private let viewContext = PersistenceController.shared.viewContext
    @Published var noteList = [Note]()
    
    var patient: Patient?
    
    init(patient: Patient?) {
        self.patient = patient
        fetchNotes()
    }
    
    func fetchNotes() {
        if let patient = patient {
            noteList = patient.noteList
        } else {
            noteList = []
        }
    }

    func addNote(title: String, content: String, recordDate: Date, recordTime: Date, labelSFSymbol: String, labelText: String, isReminderActive: Bool, reminderTime: Date) {
        guard let patient = patient else {
            return
        }
        
        let note = Note(context: viewContext)
        note.id = UUID()
        note.title = title
        note.content = content
        note.recordDate = recordDate
        note.recordTime = recordTime
        note.labelSFSymbol = labelSFSymbol
        note.labelText = labelText
        note.isReminderActive = isReminderActive
        note.reminderTime = reminderTime
        
        patient.addToNotes(note)
        save()
        fetchNotes()
        print("saved!")
        objectWillChange.send()
    }
    
    func deleteNote(note: Note) {
        guard let patient = patient else {
            return
        }
        
        patient.removeFromNotes(note)
        viewContext.delete(note)
        save()
        fetchNotes()
    }
    
    func save() {
        do {
            try viewContext.save()
        } catch {
            print("Error saving note: \(error)")
        }
    }
}
