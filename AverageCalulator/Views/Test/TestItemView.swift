//
//  SubjectItemView.swift
//  AverageCalulator
//
//  Created by Samantha Stewart on 2023-06-01.
//
import Blackbird
import SwiftUI

struct TestItemView: View {
    let name: String
    let score: Int
    let outof: Int
    
    var body: some View {
        HStack {
            Text(name)
                .font(.title3)
                .bold()
            
//            Text("\(score)")
            Text("\(score)\\\(outof)")

        }
    }
}
                 
                 
                 
