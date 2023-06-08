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
    @BlackbirdLiveQuery(tableName:"Test", { db in
        try await db.query("SELECT * FROM SubjectsWithStats")
    }) var subjects
    
    var body: some Scene {
        WindowGroup {
            TabView {
                
                
             
                TestsGroupedBySubjectListView(averageScore: 3, averageOutof: 3)
                    .tabItem {
                        Image(systemName: "plus.circle")
                        Text("Recent Tests")
                    }

        
                
            }
            .environment(\.blackbirdDatabase, AppDatabase.instance)


            
            
            
            
        }
        
        
    }
}


