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
    @State var Name = ""
    @State var score = ""
    @State var outof = ""
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
                            
                
                Button(action: {
                    // Write to database
                    Task {
                        try await db!.transaction { core in
                            try core.query("""
                                    INSERT INTO Test (
                                        Name,
                                        score,
                                        outof
                                    )
                                    VALUES (
                                        (?),
                                        (?),
                                        (?)
                                    )
                                    """,
                                           Name,
                                           score,
                                           outof)
                        }
                        // Reset input fields after writing to database
                        Name = ""
                        score = ""
                        outof = ""
                    }
                }, label: {
                    Text("Add")
                        .font(.title)
                })
            }
            
            
            
            
            
        }
    }
}

struct AddTestView_Previews: PreviewProvider {
    static var previews: some View {
        AddTestView()
    }
}
