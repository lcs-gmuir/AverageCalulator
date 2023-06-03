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
    @State var name = ""
    @State var score = ""
    @State var outof = ""
    var body: some View {
        NavigationView{
            VStack(spacing: 20)  {
                
                TextField("Enter Discription", text: $name)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Score On The Test ", text: $score)
                    .keyboardType(.numberPad)
                    .textContentType(.oneTimeCode)
                    .textFieldStyle(.roundedBorder)
                
                TextField("What the Test was out of", text: $outof)
                    .keyboardType(.numberPad)
                    .textContentType(.oneTimeCode)
                    .textFieldStyle(.roundedBorder)
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        // Write to database
                        Task {
                            try await db!.transaction { core in
                                try core.query("""
                                        INSERT INTO movie (
                                            name,
                                            score,
                                            outof
                                        )
                                        VALUES (
                                            (?),
                                            (?),
                                            (?)
                                        )
                                        """,
                                               name,
                                               score,
                                               outof)
                            }
                            // Reset input fields after writing to database
                            name = ""
                            score = ""
                            outof = ""
                        }
                    }, label: {
                        Text("Add")
                    })
                }
            }
        }
    }
}

struct AddTestView_Previews: PreviewProvider {
    static var previews: some View {
        AddTestView()
    }
}
