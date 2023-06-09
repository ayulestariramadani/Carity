//
//  ListPatient.swift
//  Carity
//
//  Created by mora hakim on 05/06/23.
//

import SwiftUI

struct ListPatient: View {
    @StateObject var viewModel = ListPatientViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.colorPrimary
                List {
                    ForEach(viewModel.patient) { item in
                        Text(item.name)
                    }.onDelete(perform: viewModel.delete)
                        .swipeActions(edge: .leading) {
                            Button {
                                
                            } label: {
                                Image(systemName: "square.and.arrow.up")
                                    .foregroundColor(.white)
                                    
                            }.tint(Color.blue)

                        }

                }
                .cornerRadius(10)
                .padding(.horizontal)
                .listStyle(PlainListStyle())
                .background(Color.colorPrimary)
                .listStyle(InsetGroupedListStyle())
                
            }
            .navigationTitle("List Patient")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    
    }
}

struct ListPatient_Previews: PreviewProvider {
    static var previews: some View {
        ListPatient()
    }
}