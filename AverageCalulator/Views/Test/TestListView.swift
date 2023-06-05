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
        try await db.query("SECLECT * FROM MoviesWithTestNames")
        }) var tests
    
    @State var showingAddTestView = false
    
    var body: some View {
        
        NavigationView {
            
           
            List(tests.results, id: \.self) { currentTest in
                
                if let name = currentTest["name"]?.stringValue,
                   let subject = currentTest["subject"]?.stringValue,
                   let score = currentTest["score"]?.intValue,
                   let outof = currentTest["outof"]?.intValue {
                    
                    TestItemView(name: name,
                                  subject: subject,
                                  score: score,
                                  outof: outof)
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
