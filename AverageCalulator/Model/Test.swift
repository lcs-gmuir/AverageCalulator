//
//  Subject.swift
//  AverageCalulator
//
//  Created by Samantha Stewart on 2023-06-01.
//
import Blackbird
import Foundation

struct Test: BlackbirdModel{
    @BlackbirdColumn var name: String
    @BlackbirdColumn var score: Int
    @BlackbirdColumn var outof: Int
}
