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
                }
            }
        }.listStyle(.inset).cornerRadius(11).navigationBarTitle("Notes")
//            .searchable(text: $searchedText, prompt: "Search Note").autocorrectionDisabled(true)
    }
}

