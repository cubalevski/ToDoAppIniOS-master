//
//  DateMonthHelper.swift
//  ToDoPro
//
//  Created by Simon Cubalevski on 6/20/19.
//  Copyright © 2019 Simon Cubalevski. All rights reserved.
//

import Foundation

class  DateMonthHelper {
    
   func getcurrentdateString()-> String{
         let date = Date()
         let dateformatter = DateFormatter()
          dateformatter.dateFormat = "MMM d, yyyy"
          dateformatter.string(from: date)
         return "TODAY : \(dateformatter.string(from: date))"
    }
}
