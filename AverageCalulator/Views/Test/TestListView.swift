//
//  SubjectListView.swift
//  AverageCalulator
//
//  Created by Samantha Stewart on 2023-06-01.
//
import Blackbird
import SwiftUI

struct TestListView: View {
    
    @BlackbirdLiveQuery(tableName:"Test", { db in
        try await db.query("SELECT * FROM TestsWithSubjectNames")
    }) var tests
    
    @State var showingAddTestView = false
    
    var body: some View {
        
        NavigationView {
            
            
            List(tests.results, id: \.self) { currentTest in
                
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
            
            .navigationTitle("Tests")
            
            
        }
        
    }
    
}


struct TestListView_Previews: PreviewProvider {
    static var previews: some View {
        TestListView()
            .environment(\.blackbirdDatabase, AppDatabase.instance)
    }
}
