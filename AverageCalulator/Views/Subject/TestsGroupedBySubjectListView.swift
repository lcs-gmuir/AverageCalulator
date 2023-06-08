//
//  SubjectListView.swift
//  AverageCalulator
//
//  Created by Samantha Stewart on 2023-06-01.
//
import Blackbird
import SwiftUI

struct TestsGroupedBySubjectListView: View {
    
    @BlackbirdLiveQuery(tableName:"Test", { db in
        try await db.query("SELECT * FROM TestsWithSubjectNames")
    }) var tests
    
    
    
    var body: some View {
        
        NavigationView {
            
            List{
                Section(content:{
                    Text("a")
                    Text("b")
                    
                }, header: {
                    Text("Group one ")
                })
                Section(content: {
                    Text("c")
                }, header: {
                    Text("group two")
                })
                
            }
            .listStyle(.grouped)
            
            .navigationTitle("Recent Tests")
            
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    optionPopUp()
                    
                }
            }
            
            
            
            
        }
        
        
    }
    
}



