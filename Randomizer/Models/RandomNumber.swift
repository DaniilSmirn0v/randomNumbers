//
//  RandomNumber.swift
//  Randomizer
//
//  Created by Даниил Смирнов on 28.03.2022.
//

import Foundation

struct RandomNumber {
    var minimumValue: Int
    var maximumValue: Int
    
    var getRandom: Int {
        Int.random(in: minimumValue...maximumValue)
    }
}
