//
//  UIElementExtentions.swift
//  MedicalApplication
//
//  Created by Hala on 10/04/2021.
//

import UIKit

extension UITextField{
    
    func border(){
        
        let layer = CALayer()
        layer.frame = CGRect(x: 0.0, y: self.frame.size.height - 2.0, width: self.frame.size.width, height: 2.0)
        
        layer.backgroundColor = MainColors.instance.secondaryColor.cgColor
        self.layer.addSublayer(layer)
    }
    
    
}


extension String{
    func localized() -> String {
        return NSLocalizedString(self, tableName: "Localizable", bundle: .main, value: self, comment: self)
    }
}
