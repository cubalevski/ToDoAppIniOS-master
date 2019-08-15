//
//  CustomImageview.swift
//  ToDoPro
//
//  Created by Simon Cubalevski on 6/20/19.
//  Copyright © 2019 Simon Cubalevski. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class Customimageview: UIImageView{
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet{
            updateUI()
        }
        
    }
    @IBInspectable var borderColor : UIColor  =  UIColor.clear {
        didSet{
            updateUI()
        }
        
    }
    
    @IBInspectable var cornerRadius : CGFloat = 0.0 {
        
        didSet{
            updateUI()
        }
    }
    
    func updateUI(){
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
      
    }
}
