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
            Button(action: placeOrder) {
                 Text("New Test")
                     .font(.title3) // Set the desired font size
             }
             Button(action: adjustOrder) {
                 Text("New Subject")
             }
        } label: {
            Label("Options", systemImage: "plus")
                .font(.title) // Set the font size to .title or any other desired value
                      .imageScale(.large) // Set the image scale to .large or any other desired value
                      .bold()
        }
        .sheet(isPresented: $showingAddTestView) {
            AddTestView()
                .presentationDetents([.fraction(0.47)])
        }
        .sheet(isPresented: $showingAddSubjectView) {
            AddSubjectView()
                .presentationDetents([.fraction(0.8)])
    }
                }
      
           
        
    
    func placeOrder() { showingAddTestView = true }
    func adjustOrder() {  showingAddSubjectView = true }
}
