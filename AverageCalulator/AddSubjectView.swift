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
                Text("Tab 1")
                    .tabItem {   SubjectListView()
                        Label("Tab 1", systemImage: "1.circle")
                    }
                
                Text("Tab 2")
                    .tabItem { AddTestView()
                        Label("Tab 2", systemImage: "2.circle")
                    }
                
            }
            
              
         
                
                
            
         
            .environment(\.blackbirdDatabase, AppDatabase.instance)       }
    }
}
                                                                                                       
