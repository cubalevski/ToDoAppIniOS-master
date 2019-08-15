//
//  Extensions.swift
//  ToDoPro
//
//  Created by Simon Cubalevski on 6/20/19.
//  Copyright © 2019 Simon Cubalevski. All rights reserved.
//

import Foundation
import  UIKit
extension Notification.Name {
    static let removechildcontroller = Notification.Name("removechildcontroller")
}

extension UILabel {
    func attributedString(stringtobechanged:String){
        let attributedString = NSMutableAttributedString(string: stringtobechanged)
        attributedString.addAttribute(NSAttributedStringKey.strikethroughStyle, value: 1, range: NSMakeRange(0, attributedString.length))
    self.attributedText = attributedString
    }
}

