//
//  NoteReview.swift
//  Carity
//
//  Created by Rizaldi Septian Fauzi on 08/06/23.
//

import SwiftUI

struct NoteReview: View {
    @StateObject var viewModel = ListNotesViewModel()
    
    @State private var showDeleteNoteAlert : Bool = false
    //    @State private var deletedNote : IndexSet
    var review_tittle : String
    
    var isThisWeek : Bool
    var isRemindedSoon : Bool
    
    @State private var isNavigate : Bool = false
    //    @Binding var searchedText : String
    
    var body: some View {
        List{
            HStack{
                Text(review_tittle).font(.body).fontWeight(.semibold)
                Spacer()
                if isThisWeek {
                    Button("Show More", action: {
                        isNavigate.toggle()
                    }).font(.footnote).fontWeight(.semibold)
                }
            }.foregroundColor(Color("dark"))
                .navigationDestination(isPresented: $isNavigate){Notes(searchedText: "")}
            ForEach(viewModel.notes,id:\.id) { note in
                Button( action:{
                    //edit note
                }){
                    //                    if isRemindedSoon {
                    //                        if note.note_isReminded {
                    //                            NoteCard(note_tittle: note.note_tittle, note_recordTime: note.note_recordTime, note_recordDate: note.note_recordDate, note_labelSFSymbol: note.note_labelSFSymbol, note_labelText: note.note_labelText, note_isReminded: note.note_isReminded)
                    //                        } else {
                    //                            //help
                    //                        }
                    //                    } else {
                    //                        NoteCard(note_tittle: note.note_tittle, note_recordTime: note.note_recordTime, note_recordDate: note.note_recordDate, note_labelSFSymbol: note.note_labelSFSymbol, note_labelText: note.note_labelText, note_isReminded: note.note_isReminded)
                    //                    }
                    NoteCard(note_tittle: note.note_tittle, note_recordTime: note.note_recordTime, note_recordDate: note.note_recordDate, note_labelSFSymbol: note.note_labelSFSymbol, note_labelText: note.note_labelText, note_isReminded: note.note_isReminded)
                    
                }
            }
            //            .onDelete{ indexSet in
            ////                deletedNote = indexSet
            //                showDeleteNoteAlert.toggle()
            //            }
            //            .alert(isPresented: $showDeleteNoteAlert) {
            //                Alert(
            //                    title: Text("""
            //                                Delete Note "\(viewModel.notes[0].note_tittle)"
            //                                """),
            //                    message: Text("This note will be deleted from all your devices. You can't undo this action."),
            //                    primaryButton: .default(
            //                        Text("Cancel").fontWeight(.bold),
            //                        action: {}
            //                    ),
            //                    secondaryButton: .destructive(
            //                        Text("Delete"),
            //                        action: {
            //                            //delete patient
            //                        }
            //                    )
            //                )
            //            }
        }.listStyle(.inset).cornerRadius(11)
        //            .searchable(text: $searchedText)
    }
}

