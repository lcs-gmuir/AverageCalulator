//
//  AddSubjectView.swift
//  AverageCalulator
//
//  Created by Samantha Stewart on 2023-06-01.
//
import Blackbird
import SwiftUI

// Testing
struct AddSubjectView: View {
    @Environment(\.blackbirdDatabase) var db: Blackbird.Database?
    @State var subject = ""
    
    var body: some View {
        NavigationView{
            VStack{
                TextField("Enter the subject name", text: $subject)
                    .textFieldStyle(.roundedBorder)
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        // Write to database
                        Task {
                            try await db!.transaction { core in
                                try core.query("INSERT INTO Subject (subject) VALUES (?)"
                                )
                            }
                            // Reset input fields after writing to database
                            subject = ""
                            
                        }
                    }, label: {
                        Text("Add")
                    })
                }
            }
            
            
            
            
        }
    }
}



struct AddSubjectView_Previews: PreviewProvider {
    static var previews: some View {
        AddSubjectView()
            .environment(\.blackbirdDatabase, AppDatabase.instance)
    }
}
