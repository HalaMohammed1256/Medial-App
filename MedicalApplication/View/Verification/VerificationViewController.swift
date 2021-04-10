//
//  VerificationViewController.swift
//  MedicalApplication
//
//  Created by Hala on 10/04/2021.
//

import UIKit

class VerificationViewController: UIViewController {
    
    // variables
    
    
    // outlets
    @IBOutlet weak var firstNumberTextField: UITextField!{
        didSet{
            firstNumberTextField.delegate = self
        }
    }
    
    @IBOutlet weak var secondNumberTextField: UITextField!{
        didSet{
            secondNumberTextField.delegate = self
        }
    }
    
    @IBOutlet weak var thirdNumberTextField: UITextField!{
        didSet{
            thirdNumberTextField.delegate = self
        }
    }
    
    @IBOutlet weak var fourthNumberTextField: UITextField!{
        didSet{
            fourthNumberTextField.delegate = self
        }
    }
    
    @IBOutlet weak var fifthNumberTextField: UITextField!{
        didSet{
            fifthNumberTextField.delegate = self
        }
    }
    
    @IBOutlet weak var sixthNumberTextField: UITextField!{
        didSet{
            sixthNumberTextField.delegate = self
        }
    }
    
    @IBOutlet weak var verifyButton: UIButton!
    @IBOutlet weak var changeLanguageButton: UIButton!
    
    @IBOutlet weak var subView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        firstNumberTextField.border()
        secondNumberTextField.border()
        thirdNumberTextField.border()
        fourthNumberTextField.border()
        fifthNumberTextField.border()
        sixthNumberTextField.border()
        
        
        
        ///
        
        firstNumberTextField.backgroundColor = .clear
        secondNumberTextField.backgroundColor = .clear
        thirdNumberTextField.backgroundColor = .clear
        fourthNumberTextField.backgroundColor = .clear
        fifthNumberTextField.backgroundColor = .clear
        sixthNumberTextField.backgroundColor = .clear
        
        ///
        
        verifyButton.backgroundColor = MainColors.instance.secondaryColor
        changeLanguageButton.tintColor = MainColors.instance.secondaryColor
        verifyButton.tintColor = UIColor.white
        verifyButton.layer.cornerRadius = 20
        
        
    }

    
    // Actions
    @IBAction func changeLanguageTapped(_ sender: Any) {
    }
    
    
    
}


extension VerificationViewController: UITextFieldDelegate{
    
    func goNext(textField: UITextField){
        
        switch textField {
        
        case firstNumberTextField:
            secondNumberTextField.becomeFirstResponder()
            
        case secondNumberTextField:
            thirdNumberTextField.becomeFirstResponder()
            
        case thirdNumberTextField:
            fourthNumberTextField.becomeFirstResponder()
            
        case fourthNumberTextField:
            fifthNumberTextField.becomeFirstResponder()
            
        case fifthNumberTextField:
            sixthNumberTextField.becomeFirstResponder()
            
        default:
            break
        }
    }
    
    
    func goBack(textField: UITextField){
        
        switch textField {

        case sixthNumberTextField:
            fifthNumberTextField.becomeFirstResponder()
            
        case fifthNumberTextField:
            fourthNumberTextField.becomeFirstResponder()
            
        case fourthNumberTextField:
            thirdNumberTextField.becomeFirstResponder()
            
        case thirdNumberTextField:
            secondNumberTextField.becomeFirstResponder()
            
        case secondNumberTextField:
            firstNumberTextField.becomeFirstResponder()
            
        default:
            break
        }
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField.text!.count < 1 && string.count > 0{
            
            goNext(textField: textField)
            textField.text = string
            return false
            
        }else if textField.text!.count >= 1 && string.count == 0{
            
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
