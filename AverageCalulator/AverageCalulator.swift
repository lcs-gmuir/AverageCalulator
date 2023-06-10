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
            TestsGroupedBySubjectListView()
            .environment(\.blackbirdDatabase, AppDatabase.instance)


            
            
            
            
        }
        
        
    }
}


