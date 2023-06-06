//
//  OptionsPopUP.swift
//  AverageCalulator
//
//  Created by Samantha Stewart on 2023-06-06.
//

import SwiftUI
import Blackbird



struct optionPopUp: View {
    @State var showingAddTestView = false
    @State var showingAddSubjectView = false
    
    var body: some View{
        
      
        Menu {
            Button("New Test", action: placeOrder)
            Button("New Subject", action: adjustOrder)
        } label: {
            Label("Options", systemImage: "plus")
        }
        .sheet(isPresented: $showingAddTestView) {
            AddTestView()
                .presentationDetents([.fraction(0.47)])
        }
        .sheet(isPresented: $showingAddSubjectView) {
            AddSubjectView()
                .presentationDetents([.fraction(0.15)])
    }
                }
      
           
        
    
    func placeOrder() { showingAddTestView = true }
    func adjustOrder() {  showingAddSubjectView = true }
}
