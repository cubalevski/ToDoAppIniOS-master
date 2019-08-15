//
//  CustomButtom.swift
//  ToDoPro
//
//  Created by Simon Cubalevski on 6/20/19.
//  Copyright © 2019 Simon Cubalevski. All rights reserved.
//

import UIKit

@IBDesignable class CustomButtom: UIButton{
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet{
            
            updateUI()
        }
    }
    
    @IBInspectable var FirstColor: UIColor = UIColor.clear {
        didSet {
             updateUI()
        }
    }
    
    @IBInspectable var SecondColor: UIColor = UIColor.clear {
        didSet {
            updateUI()
        }
    }
    
    func updateUI(){
        self.layer.cornerRadius = cornerRadius
        let gradientLayer =  CAGradientLayer()
        gradientLayer.colors = [FirstColor.cgColor, SecondColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 0)
        gradientLayer.frame = self.bounds
        self.layer.addSublayer(gradientLayer)
    }
    
}

