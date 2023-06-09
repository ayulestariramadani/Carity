//
//  LabelSFSymbol.swift
//  Carity
//
//  Created by Rizaldi Septian Fauzi on 08/06/23.
//

import SwiftUI

enum LabelSFSymbol: String, View {
    case condition_allergyAndIntolerance    = "exclamationmark.circle.fill"
    case condition_symptom                  = "bubbles.and.sparkles.fill"
    case assessment_consultation            = "list.bullet.clipboard.fill"
    case assessment_clinicalDocument        = "heart.text.square.fill"
    case treatment_medication               = "pills.fill"
    case treatment_foodAndNutrition         = "fork.knife"
    case behaviour_habitAndPreference       = "infinity"
    case behaviour_ritual                   = "repeat"
    case other                              = "questionmark.circle.fill"
    
    var body: some View {
        switch self{
        case .condition_symptom, .condition_allergyAndIntolerance :
            Image(systemName: rawValue).foregroundColor(Color("condition"))
        case .assessment_consultation, .assessment_clinicalDocument :
            Image(systemName: rawValue).foregroundColor(Color("assessment"))
        case .treatment_medication, .treatment_foodAndNutrition :
            Image(systemName: rawValue).foregroundColor(Color("treatment"))
        case .behaviour_ritual, .behaviour_habitAndPreference :
            Image(systemName: rawValue).foregroundColor(Color("behaviour"))
        case .other :
            Image(systemName: rawValue).foregroundColor(Color("50%"))
        }
    }
}
