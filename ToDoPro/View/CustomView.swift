//
//  CustomView.swift
//  ToDoPro
//
//  Created by Simon Cubalevski on 6/20/19.
//  Copyright © 2019 Simon Cubalevski. All rights reserved.
//

import Foundation
import  UIKit
@IBDesignable class CustomView : UIView{
    @IBInspectable var cornerRadius : CGFloat = 0.0 {
        
        didSet{
            updateUI()
        }
    }
    
    func updateUI(){
        self.layer.cornerRadius = cornerRadius
        
    }
    
}
