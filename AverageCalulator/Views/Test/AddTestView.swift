//
//  AddTestView.swift
//  AverageCalulator
//
//  Created by Samantha Stewart on 2023-06-02.
//
import Blackbird
import SwiftUI

struct AddTestView: View {
    
    @Environment(\.blackbirdDatabase) var db: Blackbird.Database?
    @BlackbirdLiveModels({ db in
    try await Subject.read(from: db)
}) var subjects
    

@State var Name = ""
@State var score = ""
@State var outof = ""
@State var subject_id = 1
    
var body: some View {
    NavigationView{
        VStack(spacing: 30)  {
            
            TextField("Enter Test Name", text: $Name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(height: 30)
                .padding(5)
                .background(Color.blue)
            
            TextField("Enter Your test score", text: $score)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                .textContentType(.oneTimeCode)
                .frame(height: 30)
                .padding(5)
                .background(Color.blue)
            
            
            
            TextField("Enter what The test Was Out of", text: $outof)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                .frame(height: 30)
                .padding(5)
                .background(Color.blue)
            
            Picker(selection: $subject_id,
                   label: Text("select subject "),
                   content: {
                ForEach(subjects.results) { currentSubject in
                    Text(currentSubject.name).tag(currentSubject.id)
                }
            })
            
            
            
            
            Button(action: {
                // Write to database
                Task {
                    try await db!.transaction { core in
                        try core.query("""
                                    INSERT INTO Test (
                                        Name,
                                        score,
                                        outof,
                                    subject_id
                                    
                                    )
                                    VALUES (
                                        (?),
                                        (?),
                                        (?),
                                        (?)
                                    )
                                    """,
                                       Name,
                                       score,
                                       outof,
                                       subject_id)
                    }
                    // Reset input fields after writing to database
                    Name = ""
                    score = ""
                    outof = ""
                    subject_id = 1
                }
            }, label: {
                Text("Add")
                    .font(.title)
            })
            Spacer()
        }
        Spacer()
        
        
        
        
        
    }
}
}

struct AddTestView_Previews: PreviewProvider {
    static var previews: some View {
        AddTestView()
    }
}
