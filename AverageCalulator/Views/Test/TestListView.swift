//
//  SubjectListView.swift
//  AverageCalulator
//
//  Created by Samantha Stewart on 2023-06-01.
//
import Blackbird
import SwiftUI

struct TestListView: View {
    
    @BlackbirdLiveModels({ db in
        try await Test.read(from: db)
    }) var tests
    
    @State var showingAddTestView = false
    
    var body: some View {
        
        NavigationView {
            
           
            List(tests.results) { currentTest in
                TestItemView(name: currentTest.name,
                             score: currentTest.score,
                             outof: currentTest.outof)
            }
            
            .navigationTitle("Tests")
            
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        showingAddTestView = true
                    }, label: {
                        Text("New Test")
                            .font(.title2)
                    })
                    .sheet(isPresented: $showingAddTestView) {
                        AddTestView()
                            .presentationDetents([.fraction(0.15)])
                            
                    }
                    
                }
            }
        }
        
    }
    
}


struct TestListView_Previews: PreviewProvider {
    static var previews: some View {
        TestListView()
            .environment(\.blackbirdDatabase, AppDatabase.instance)
    }
}
