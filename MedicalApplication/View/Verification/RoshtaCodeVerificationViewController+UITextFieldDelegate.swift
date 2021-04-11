//
//  RoshtaCodeVerificationViewController+Extentions.swift
//  MedicalApplication
//
//  Created by Hala on 11/04/2021.
//

import UIKit

extension RoshtaCodeVerificationViewController: UITextFieldDelegate{
    
    func goNext(textField: UITextField){
        
        switch textField {
        
        case firstNumberTextField:
            secondNumberTextField.isUserInteractionEnabled = true
            secondNumberTextField.becomeFirstResponder()
            
        case secondNumberTextField:
            thirdNumberTextField.isUserInteractionEnabled = true
            thirdNumberTextField.becomeFirstResponder()
            
        case thirdNumberTextField:
            fourthNumberTextField.isUserInteractionEnabled = true
            fourthNumberTextField.becomeFirstResponder()
            
        case fourthNumberTextField:
            fifthNumberTextField.isUserInteractionEnabled = true
            fifthNumberTextField.becomeFirstResponder()
            
        case fifthNumberTextField:
            sixthNumberTextField.isUserInteractionEnabled = true
            sixthNumberTextField.becomeFirstResponder()
            
        default:
            break
        }
    }
    
    
    func goBack(textField: UITextField){
        
        switch textField {
        
        case sixthNumberTextField:
            fifthNumberTextField.becomeFirstResponder()
            sixthNumberTextField.isUserInteractionEnabled = false
            
        case fifthNumberTextField:
            fourthNumberTextField.becomeFirstResponder()
            fifthNumberTextField.isUserInteractionEnabled = false
            
        case fourthNumberTextField:
            thirdNumberTextField.becomeFirstResponder()
            fourthNumberTextField.isUserInteractionEnabled = false
            
        case thirdNumberTextField:
            secondNumberTextField.becomeFirstResponder()
            thirdNumberTextField.isUserInteractionEnabled = false
            
        case secondNumberTextField:
            firstNumberTextField.becomeFirstResponder()
            secondNumberTextField.isUserInteractionEnabled = false
            
        default:
            break
        }
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField.text!.count < 1 && string.count > 0{
            
            goNext(textField: textField)
            textField.text = string
            return false
            
        }
        else if textField.text!.count >= 1 && string.count == 0{
            
            goBack(textField: textField)
            textField.text = ""
            return false
            
        }else if textField.text!.count >= 1{
            
            textField.text = string
            return false
            
        }
        
        return true
    }
    
    
    
    
}
