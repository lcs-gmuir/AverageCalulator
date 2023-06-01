//
//  SubjectListView.swift
//  AverageCalulator
//
//  Created by Samantha Stewart on 2023-06-01.
//
import Blackbird
import SwiftUI

struct SubjectListView: View {
    
    @BlackbirdLiveModels({ db in
        try await Subject.read(from: db)
    }) var subjects
    
    var body: some View {
        NavigationView {
            List(subjects.results) { currentSubject in
                SubjectItemView(subject: currentSubject.subject)
            }
        }
        .navigationTitle("subjects")
    }
}


struct SubjectListView_Previews: PreviewProvider {
    static var previews: some View {
        SubjectListView()
            .environment(\.blackbirdDatabase, AppDatabase.instance)
    }
}
