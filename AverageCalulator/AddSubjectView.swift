//
//  AverageCalulatorApp.swift
//  AverageCalulator
//
//  Created by Samantha Stewart on 2023-06-01.
//
import Blackbird
import SwiftUI

@main
struct AverageCalulatorApp: App {
    var body: some Scene {
        WindowGroup {
            
              
            SubjectListView()
                
                
            
         
            .environment(\.blackbirdDatabase, AppDatabase.instance)       }
    }
}
                                                                                                       
