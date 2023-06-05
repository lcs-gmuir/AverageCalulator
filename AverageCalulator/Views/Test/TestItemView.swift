//
//  SubjectItemView.swift
//  AverageCalulator
//
//  Created by Samantha Stewart on 2023-06-01.
//
import Blackbird
import SwiftUI

struct TestItemView: View {
    let Name: String
    let score: Int
    let outof: Int
    let subject: String
 
    
    var body: some View {
        HStack {
            Text(Name)
                .font(.title3)
                .bold()
            
//            Text("\(score)")
            Text("\(score)")
            Text("/")
            Text("\(outof)")
            Text(subject)
           

        }
    }
}
                 
                 
                 
