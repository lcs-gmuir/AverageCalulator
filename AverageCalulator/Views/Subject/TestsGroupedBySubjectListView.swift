//
//  SubjectListView.swift
//  AverageCalulator
//
//  Created by Samantha Stewart on 2023-06-01.
//
import Blackbird
import SwiftUI

struct TestsGroupedBySubjectListView: View {
    
    @BlackbirdLiveQuery(tableName:"Tests", { db in
        try await db.query("SELECT * FROM SubjectsWithStats")
    }) var subjects
    
    
    
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
                
                ForEach(subjects.results, id: \.self) { currentSubject in
                    
                    Section(content:{
                        Text ("movies will go here")
                    }, header: {
                        
                        if let subjectName = currentSubject["subject"]?.stringValue {
                            Text(subjectName)
                        }
                    })
                    
                }
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



