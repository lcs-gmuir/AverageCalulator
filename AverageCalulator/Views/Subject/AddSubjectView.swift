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
                ZStack{
                    HStack{
                        
                        TextField("Enter Subject", text: $subject)
                            .textFieldStyle(.roundedBorder)
                        
                            .toolbar {
                                ToolbarItem(placement: .primaryAction) {
                                    Button(action: {
                                        Task{
                                            try await db!.transaction { core in
                                                try core.query("INSERT INTO Subject (subject) VALUES (?)", subject)
                                                
                                            }
                                            subject = ""
                                        }
                                    }, label:{
                                        Image(systemName: "plus")
                                            .font(.caption)
                                        
                                    })
                                }
                            }
                       
                        
                        
                    }
                    
                }
                Spacer()
                
            }
            .padding(5)
            
            
           
        }
        
       
    }
    
    
    
    
    struct AddSubjectView_Previews: PreviewProvider {
        static var previews: some View {
            AddSubjectView()
                .environment(\.blackbirdDatabase, AppDatabase.instance)
        }
    }
}
