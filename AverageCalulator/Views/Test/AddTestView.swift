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
    @State var score = 1
    @State var outof = 1
    var body: some View {
        NavigationView{
            VStack(spacing: 20)  {
                
                TextField("Enter Discription", text: $name)
                    .textFieldStyle(.roundedBorder)
                
                Picker("Select a number", selection: $score) {
                            ForEach(1...100, id: \.self) {
                                Text("\($0)")
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                        .labelsHidden()
                
                Picker("Select a number", selection: $outof) {
                            ForEach(1...100, id: \.self) {
                                Text("\($0)")
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                        .labelsHidden()
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
                            score = 1
                            outof = 1
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
