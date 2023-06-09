//
//  Patient.swift
//  Carity
//
//  Created by mora hakim on 05/06/23.
//

import Foundation

struct Patient: Identifiable {
    var id = UUID()
    var nickName: String
    var fullName: String
    var birthDate: String
    var diseas: String
    var description: String
    var height: Int
    var weight: Int
    var bloodType: String
    var image: String
}


