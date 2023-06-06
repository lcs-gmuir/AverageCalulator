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
    
    
    
    
    
    struct AddSubjectView_Previews: PreviewProvider {
        static var previews: some View {
            AddSubjectView()
                .environment(\.blackbirdDatabase, AppDatabase.instance)
        }
    }
    
}
