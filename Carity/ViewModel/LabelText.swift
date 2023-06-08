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
        switch self{
        case .condition_symptom, .condition_allergyAndIntolerance :
            Text(rawValue).foregroundColor(Color("condition"))
        case .assessment_consultation, .assessment_clinicalDocument :
            Text(rawValue).foregroundColor(Color("assessment"))
        case .treatment_medication, .treatment_foodAndNutrition :
            Text(rawValue).foregroundColor(Color("treatment"))
        case .behaviour_ritual, .behaviour_habitAndPreference :
            Text(rawValue).foregroundColor(Color("behaviour"))
        case .other :
            Text(rawValue).foregroundColor(Color("50%"))
        }
    }
}
