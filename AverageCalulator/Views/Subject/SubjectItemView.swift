//
//  SubjectItemView.swift
//  AverageCalulator
//
//  Created by Samantha Stewart on 2023-06-01.
//
import Blackbird
import SwiftUI

struct SubjectItemView: View {
    let subject: String
    
    var body: some View {
        HStack {
            Text(subject)
                .font(.title)
                .bold()
            Text("avg")
        }
        }
    }


struct SubjectItemView_Previews: PreviewProvider {
    static var previews: some View {
        SubjectItemView(subject: "math")
            .environment(\.blackbirdDatabase, AppDatabase.instance)
    }
}
