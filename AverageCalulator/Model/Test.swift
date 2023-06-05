//
//  Subject.swift
//  AverageCalulator
//
//  Created by Samantha Stewart on 2023-06-01.
//
import Blackbird
import Foundation

struct Test: BlackbirdModel{
    @BlackbirdColumn var Name: String
    @BlackbirdColumn var score: Int
    @BlackbirdColumn var outof: Int
    @BlackbirdColumn var id: Int
    @BlackbirdColumn var Subject_id: Int
    @BlackbirdColumn var subject: String
}

