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
    @BlackbirdLiveModels({ db in
        try await Subject.read(from: db)
    }) var subjects
    
    
    @State var name = ""
    
    var body: some View {
        
        NavigationView{
            
            ZStack{
                VStack{
                    
                    ZStack{
                        HStack{
                            
                            TextField("Enter Subject", text: $name)
                                .textFieldStyle(.roundedBorder)
                                .frame(height: 30)
                                .padding(5)
                                .background(Color.blue)
                            
                            
                            
                            
                            
                        }
                        
                        
                    }
                    
                    List(subjects.results) {  currentSubject in
                            Text(currentSubject.name).tag(currentSubject.id)
                    }

                    Button(action: {
                        Task{
                            try await db!.transaction { core in
                                try core.query("INSERT INTO Subject (name) VALUES (?)", name)
                                
                            }
                            name = ""
                        }
                    }, label:{
                        Text("ADD")
                            .font(.title2)
                        
                    })
                }
                
                
                
                
                
                
            }
            
        }
        
        
    }
}
    
    
    
    

