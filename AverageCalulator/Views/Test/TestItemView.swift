//
//  SubjectItemView.swift
//  AverageCalulator
//
//  Created by Samantha Stewart on 2023-06-01.
//
import Blackbird
import SwiftUI

struct TestItemView: View {
    let Name: String
    let score: Int
    let outof: Int
    let subject: String
    
    //    var percentage: String {
    ////        return Double(7.9232421).formatted(.number.)
    //    }
    
    var doubleScore: Double{
        return Double(score)
    }
    
    var doubleOutOf: Double{
        return Double(outof)
    }
    
    var percentage: Double {
        return doubleScore/doubleOutOf*100
    }
    
    var body: some View {
        
        ZStack{
            VStack{
                HStack{
                    Text(Name)
                        .font(.title3)
                        .bold()
                        .padding(10)
                    Spacer()
                    Text("\(percentage)")
                        .font(.title3)
                        .bold()
                    
                    
                }
                HStack{
                    Text(subject)
                    Spacer()
                    
                    
                    Text("\(score)")
                    Text("/")
                    Text("\(outof)")
                }
                .foregroundColor(.gray)
                
            }
            //            RoundedRectangle(cornerRadius: 10)
            //                                                .strokeBorder(Color.black, lineWidth: 2)
            //                                                .cornerRadius(10)
            //                                                .frame(width:300, height: 100
            //                                                )
            
        }
        
        
        
        
    }
}



