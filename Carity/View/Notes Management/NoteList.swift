//
//  NoteList.swift
//  Carity
//
//  Created by Rizaldi Septian Fauzi on 09/06/23.
//

import SwiftUI

struct NoteList: View {
    @StateObject var viewModel = ListNotesViewModel()
    
    @Binding var searchedText : String
    
    var body: some View {
        List{
            ForEach(viewModel.notes,id:\.id) { note in
                Button( action:{
                    //edit note
                }){
                    NoteCard(note_tittle: note.note_tittle, note_recordTime: note.note_recordTime, note_recordDate: note.note_recordDate, note_labelSFSymbol: note.note_labelSFSymbol, note_labelText: note.note_labelText, note_isReminded: note.note_isReminded)
                }
            }
        }.listStyle(.inset).cornerRadius(11).navigationBarTitle("Notes")
            .searchable(text: $searchedText, prompt: "Search Note")
    }
}

