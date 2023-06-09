//
//  LabelText.swift
//  Carity
//
//  Created by Rizaldi Septian Fauzi on 08/06/23.
//

import SwiftUI

enum LabelText: String, View {
    case condition_allergyAndIntolerance    = "Allergy and Intolerance"
    case condition_symptom                  = "Symptom"
    case assessment_consultation            = "Consultation"
    case assessment_clinicalDocument        = "Clinical Document"
    case treatment_medication               = "Medication"
    case treatment_foodAndNutrition         = "Food and Nutrition"
    case behaviour_habitAndPreference       = "Habit and Preference"
    case behaviour_ritual                   = "Ritual"
    case other                              = ""
    
    var body: some View {
        Text(rawValue).foregroundColor(Color("tale_main"))
    }
}
