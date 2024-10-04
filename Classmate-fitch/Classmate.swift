//
//  Classmate.swift
//  Classmate-fitch
//
//  Created by MATTHEW FITCH on 10/2/24.
//

import Foundation

enum PicklesOptions: Int {
    case Yes = 0
    case No = 2
    case ALittleBit = 1
}

class Classmate {
    var name: String
    var nickname: String
    var year: Int
    var pickles: PicklesOptions
    
    
    init(name: String, nickname: String, year: Int, pickles: PicklesOptions) {
        self.name = name
        self.nickname = nickname
        self.year = year
        self.pickles = pickles
    }
    
    init()
    {
        self.name = "AHHH"
        self.nickname = "AHHH AHH"
        self.year = 2
        self.pickles = .No
    }
}
