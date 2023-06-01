//
//  Subject.swift
//  AverageCalulator
//
//  Created by Samantha Stewart on 2023-06-01.
//
import Blackbird
import Foundation
struct Subject: BlackbirdModel{
    @BlackbirdColumn var id: Int
    @BlackbirdColumn var subject: String
}
