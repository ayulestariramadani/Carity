//
//  Notes.swift
//  Carity
//
//  Created by Rizaldi Septian Fauzi on 08/06/23.
//

import SwiftUI

struct Notes: View {
    @AppStorage("total_note")
    var total_note: Int = 0
    
    @State var searchedText : String
    
    //note_data
//    var total_note : Int = 0
    //alert
    @State private var showDeletePatientAlert : Bool = false
    @State private var isSaved : Bool = false
    
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color("mint").ignoresSafeArea()
                VStack{
                    
                    if total_note == 0 {
                        Button("\(Image(systemName: "square.and.pencil")) Add Note", action: {
                            //add Note
                        }).font(.body).fontWeight(.semibold).frame(minWidth: 358, maxWidth: 398, minHeight: 60, maxHeight: 60).background(Color("white")).foregroundColor(Color("dark"))
                            .clipShape(RoundedRectangle(cornerRadius: 11))
                        List{
                            
                        }.listStyle(.plain).cornerRadius(11).hidden()
                    } else {
                        NoteList(searchedText: $searchedText)
                    }
                }
                .padding(.horizontal, 16.0).lineLimit(nil)
                
            }
            .toolbar(){
                ToolbarItem(placement: .bottomBar){
                    HStack{
                        if total_note > 1 {
                            Text("\(total_note) notes").font(.body).fontWeight(.bold).foregroundColor(Color("dark"))
                        } else if total_note == 1 {
                            Text("\(total_note) note").font(.body).fontWeight(.bold).foregroundColor(Color("dark"))
                        }
                        Spacer()
                        Button( action:{
                            self.isSaved.toggle()
                        }){
                            Image(systemName: "square.and.pencil")
                            Text("Add Note")
                        }.frame(minWidth: 100, maxWidth: 128, minHeight: 40, maxHeight: 45)
                            .foregroundColor(Color("tale_main"))
                            .clipShape(RoundedRectangle(cornerRadius: 11))
                            .font(.subheadline).fontWeight(.bold)
                    }.navigationDestination(isPresented: $isSaved) {
                        AddNotePage()
                    }
                }
            }
        }
    }
}

struct Notes_Previews: PreviewProvider {
    static var previews: some View {
        Notes(searchedText: "")
    }
}
