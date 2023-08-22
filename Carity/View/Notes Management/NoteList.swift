//
//  NoteList.swift
//  Carity
//
//  Created by Rizaldi Septian Fauzi on 09/06/23.
//

import SwiftUI

struct NoteList: View {
//    @StateObject var viewModel = ListNotesViewModel()
    @ObservedObject var viewModel: NoteViewModel
    @Binding var total_note: Int
//    @Binding var searchedText : String
    
    var body: some View {
        List{
            ForEach(viewModel.noteList, id:\.id) { note in
                Button( action:{
                    //edit note
                }){
                    NoteCard(
                        title: note.title!,
                        labelSFSymbol: note.labelSFSymbol!,
                        labelText: note.labelText!,
                        isReminderActive: note.isReminderActive)
                }.accessibilityIdentifier("noteList")
            }
            .onDelete(perform: deleteNote)
        }.listStyle(.inset).cornerRadius(11).navigationTitle("")
//            .searchable(text: $searchedText, prompt: "Search Note").autocorrectionDisabled(true)
    }
    
    func deleteNote(at offsets: IndexSet) {
        // Get the notes to delete at the given offsets
        let notesToDelete = offsets.map { viewModel.noteList[$0] }
        
        // Delete the notes
        notesToDelete.forEach { note in
            viewModel.deleteNote(note: note)
        }
        
        total_note = viewModel.noteList.count
    }
}

