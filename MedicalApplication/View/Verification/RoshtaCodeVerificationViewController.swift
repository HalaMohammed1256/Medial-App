//
//  VerificationViewController.swift
//  MedicalApplication
//
//  Created by Hala on 10/04/2021.
//

import UIKit
import IQKeyboardManagerSwift
//import MOLH

class RoshtaCodeVerificationViewController: UIViewController{
    
    // variables
    var roshtaVerificationPresenter: RoshtaVerificationViewPresenter?
    var roshtaID: String?
    var pharmacyPatientData: PharmacyPatientData?
    var indicator : ActivityIndicator?
    
    let loadingView : UIView = UIView()
    
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
    
    @IBOutlet weak var getRoshtaButton: UIButton!
    @IBOutlet weak var changeLanguageButton: UIButton!
    
    @IBOutlet weak var subView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setTextFieldBorders()
        configureButtons()
        textfieldDisableEditing()
        roshtaVerificationPresenter = RoshtaVerificationPresenter.init(view: self)
        
        indicator = ActivityIndicator(view: self.view)
        
        
    }
    
    
    
    // Actions
    @IBAction func changeLanguageTapped(_ sender: Any) {
        

        
//        MOLH.setLanguageTo(MOLHLanguage.currentAppleLanguage() == "en" ? "ar" : "en")
//        MOLH.reset()
        
    }
    
    
    @IBAction func getRoshtaTapped(_ sender: Any) {
        
        roshtaID = String("\(firstNumberTextField.text!)\(secondNumberTextField.text!)\(thirdNumberTextField.text!)\(fourthNumberTextField.text!)\(fifthNumberTextField.text!)\(sixthNumberTextField.text!)")
        
        
        if roshtaID?.count == 6{
            
//            showLoadingView()
            //ShowAlert.showAlert(title: nil, message: "Loading...\n", view: self)
            
            guard let roshtaCode = roshtaID else{
                return
            }
                        
            roshtaVerificationPresenter?.checkRoshtaCode(id: roshtaCode)
            
            if roshtaVerificationPresenter?.pharmacyPatientData?.status_code == 200{
                
                let patientRoshtaDetailsViewController = self.storyboard?.instantiateViewController(identifier: String(describing: PatientRoshtaDetailsViewController.self))
                
                self.present(patientRoshtaDetailsViewController!, animated: true, completion: nil)
                
                
            }else{
                showAlert(title: "ERROR!", message: "\nplease, enter a valid roshta code", view: self)
                clearTextField()
            }
            
                        
            
        }else{
            showAlert(title: "ERROR!", message: "\nplease, enter a valid roshta code", view: self)
        }
        
    }
    

}


extension RoshtaCodeVerificationViewController: RoshtaVerificationView{
    
    func startAnimating() {
        DispatchQueue.main.async {
            self.indicator?.startAnimating()
            
        }
    }
    
    func stopAnimating() {
        DispatchQueue.main.async {
            self.indicator?.stopAnimating()
            
        }
    }
    
    
}


extension RoshtaCodeVerificationViewController{
    
    func showAlert(title: String?, message: String, view: UIViewController){
                
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
            self.clearTextField()
        }))
        view.present(alert, animated: true)
        
    }
    
    func clearTextField(){
        firstNumberTextField.text = ""
        secondNumberTextField.text = ""
        thirdNumberTextField.text = ""
        fourthNumberTextField.text = ""
        fifthNumberTextField.text = ""
        sixthNumberTextField.text = ""
    }
    
    func textfieldDisableEditing(){
        secondNumberTextField.isUserInteractionEnabled = false
        thirdNumberTextField.isUserInteractionEnabled = false
        fourthNumberTextField.isUserInteractionEnabled = false
        fifthNumberTextField.isUserInteractionEnabled = false
        sixthNumberTextField.isUserInteractionEnabled = false
    }
    
    func configureButtons(){
        changeLanguageButton.tintColor = MainColors.instance.secondaryColor
        getRoshtaButton.backgroundColor = MainColors.instance.secondaryColor
        getRoshtaButton.tintColor = UIColor.white
        getRoshtaButton.layer.cornerRadius = 20
    }
    
    func setTextFieldBorders(){
        firstNumberTextField.border()
        secondNumberTextField.border()
        thirdNumberTextField.border()
        fourthNumberTextField.border()
        fifthNumberTextField.border()
        sixthNumberTextField.border()
    }
    
}

