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
            TabView{
                AddSubjectView()
                    .tabItem{
                        Label("Advice", systemImage: "square.and.pencil.circle.fill")
                        
                    }
                SubjectListView()
                    .tabItem{
                        Label("Saved", systemImage: "square.and.arrow.down")
                        
                    }
                
            }
         
            .environment(\.blackbirdDatabase, AppDatabase.instance)       }
    }
}
