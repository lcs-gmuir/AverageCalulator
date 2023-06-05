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
            TabView {
                
                AddTestView()
                    .tabItem {
                        Image(systemName: "plus")
                        Text("Add Test")
                    }

                TestListView()
                    .tabItem {
                        Image(systemName: "plus.circle")
                        Text("Recent Tests")
                    }

                SubjectListView()
                    .tabItem {
                        Image(systemName: "person")
                        Text("Subjects")
                    }
                
            }
            .environment(\.blackbirdDatabase, AppDatabase.instance)


            
            
            
            
        }
        
        
    }
}


