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
        try await db.query("SELECT * FROM SubjectsWithStats")
    }) var subjects
    
//    let averageScore: Int
//    let averageOutof: Int
//
//    var doubleScore: Double{
//        return Double(averageScore)
//    }
//
//    var doubleOutOf: Double{
//        return Double(averageOutof)
//    }
//
//    var percentage: Double {
//        return doubleScore/doubleOutOf*100
//    }
//
//    var percentageRounded: Int {
//        return Int(percentage)
//    }
    
    var body: some View {
        
        NavigationView {
            
            List{
                
                ForEach(subjects.results, id: \.self) { currentSubject in
                    
                    Section(content:{
                        if let subjectId = currentSubject["Subject_id"]?.intValue {
                            TestListView(subjectId: subjectId)
                        }
                    }, header: {
                        
                        if let subjectName = currentSubject["subject"]?.stringValue,
                            let averageScore = currentSubject["average_score"]?.intValue,
                           let averageOutof = currentSubject["average_outof"]?.intValue
                        {
                            HStack{
                                Text(subjectName)
                                Text("\(averageScore)/\(averageOutof)")
//                                Text("\(percentageRounded)")
                                
                            }
                           
                            
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



