//
//  Chak.swift
//  Test
//
//  Created by Роман Зобнин on 24.01.2021.
//

import Foundation

 class Chak {
    var joke: String
    
    init? (data: Dictionary<String, Any>){
        guard let joke = data["joke"] as? String else {
        return nil
    }
        self.joke = joke
}
}
