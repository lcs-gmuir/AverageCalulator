//
//  SubjectListView.swift
//  AverageCalulator
//
//  Created by Samantha Stewart on 2023-06-01.
//
import Blackbird
import SwiftUI

struct TestListView: View {
    
    let subjectId: Int
    
    @BlackbirdLiveQuery var tests: Blackbird.LiveResults<Blackbird.Row>
    
    var body: some View {
        
        
        
        
        
        ForEach(tests.results, id: \.self) { currentTest in
            
            if let Name = currentTest["Name"]?.stringValue,
               let subject = currentTest["subject"]?.stringValue,
               let score = currentTest["score"]?.intValue,
               let outof = currentTest["outof"]?.intValue {
                
                TestItemView(Name: Name,
                             score: score,
                             outof: outof,
                             subject: subject)
            }
            
        }
        
        
        .navigationTitle("Recent Tests")
        
        
    }
    init(subjectId: Int){
        _tests = BlackbirdLiveQuery(tableName: "Test", { db in
            try await db.query("SELECT * FROM TestsWithSubjectNames WHERE Subject_id = \(subjectId)")
        })
        self.subjectId = subjectId
    }
    
    
    
    
    
    
    
    
 
}


