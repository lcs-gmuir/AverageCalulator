//
//  SubjectItemView.swift
//  AverageCalulator
//
//  Created by Samantha Stewart on 2023-06-01.
//
import Blackbird
import SwiftUI

struct SubjectItemView: View {
    let name: String
    
    var body: some View {
        HStack {
            Text(name)
                .font(.title)
                .bold()
            Spacer()
          
        }
        }
    }


struct SubjectItemView_Previews: PreviewProvider {
    static var previews: some View {
        SubjectItemView(name: "math")
            .environment(\.blackbirdDatabase, AppDatabase.instance)
    }
}
