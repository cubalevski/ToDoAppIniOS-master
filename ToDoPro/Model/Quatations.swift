//
//  Quatations.swift
//  ToDoPro
//
//  Created by Simon Cubalevski on 6/20/19.
//  Copyright © 2019 Simon Cubalevski. All rights reserved.
//

import Foundation

fileprivate struct Quatations  {
    let text : String
    static func allQuatations() ->[Quatations]{
        let lists = [
        Quatations(text: "Laugh And Be Merry and  better the world with a blow of laughter "),
        Quatations(text: "Work hard and play hard"),
        Quatations(text: "There is no substitute for hard work"),
        Quatations(text: "Success comes to those who strive and act"),
        Quatations(text: "Take a decision and make it  right")
        ]
        return lists
    }
    
    
    
}

class Quotes{

    func getRandomQuatoes() -> String{
        let allquotes = Quatations.allQuatations()
        let randomQuotes: Quatations = allquotes[Int(arc4random_uniform(UInt32(allquotes.count)))];
        return """
        
        "\(randomQuotes.text) "
        
        """
    }
    

}


