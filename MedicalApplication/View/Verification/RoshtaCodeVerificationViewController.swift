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
    
    
    // constraints outlet
    @IBOutlet weak var bottomSheetHeight: NSLayoutConstraint!
    
    
    // outlets
    @IBOutlet weak var bottomSheetView: UIView!
    @IBOutlet weak var doctorImageView: UIImageView!
    @IBOutlet weak var doctorNameLabel: UILabel!
    @IBOutlet weak var patientNameLabel: UILabel!
    @IBOutlet weak var drugNameLabel: UILabel!
    @IBOutlet weak var drugTypeLabel: UILabel!
    @IBOutlet weak var drugNotesLabel: UILabel!
    @IBOutlet weak var drugImageView: UIImageView!
    @IBOutlet weak var drugIconImageView: UIImageView!
    @IBOutlet weak var dismissButton: UIButton!
    
    
    
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
        configureOutlet()
        textfieldDisableEditing()
        roshtaVerificationPresenter = RoshtaVerificationPresenter.init(view: self)
        
        indicator = ActivityIndicator(view: self.view)
        
        
        
    }
    
    
    
    // Actions
    @IBAction func changeLanguageTapped(_ sender: Any) {
        

        
//        MOLH.setLanguageTo(MOLHLanguage.currentAppleLanguage() == "en" ? "ar" : "en")
//        MOLH.reset()
        
    }
    
    @IBAction func dismissBottomSheetTapped(_ sender: Any) {
        UIView.animate(withDuration: 0.3, animations: {
            self.bottomSheetHeight.constant = 0.001
            self.bottomSheetView.backgroundColor = MainColors.instance.primaryColor
            self.patientRoshtaData(isHidden: true)
            
            
        }) { (status) in
            
        }
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
                
                showBottomSheet()
                
                
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
    
    
    func showBottomSheet(){
        UIView.animate(withDuration: 0.3, animations: {
            self.bottomSheetHeight.constant = self.view.frame.height * 0.6
            self.bottomSheetView.backgroundColor = MainColors.instance.primaryColor
            self.patientRoshtaData(isHidden: false)
            
            
        }) { (status) in
            
        }
    }
    
    func patientRoshtaData(isHidden: Bool){
        bottomSheetView.isHidden = isHidden
        doctorImageView.isHidden = isHidden
        doctorNameLabel.isHidden = isHidden
        patientNameLabel.isHidden = isHidden
        drugNameLabel.isHidden = isHidden
        drugTypeLabel.isHidden = isHidden
        drugNotesLabel.isHidden = isHidden
        drugImageView.isHidden = isHidden
        drugIconImageView.isHidden = isHidden
        subView.isHidden = isHidden
        dismissButton.isHidden = isHidden
        
    }
    
    
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
    
    func configureOutlet(){
        changeLanguageButton.tintColor = MainColors.instance.secondaryColor
        getRoshtaButton.backgroundColor = MainColors.instance.secondaryColor
        getRoshtaButton.tintColor = UIColor.white
        getRoshtaButton.layer.cornerRadius = 20
        
        bottomSheetView.backgroundColor = .white//MainColors.instance.primaryColor
        bottomSheetView.layer.cornerRadius = 30
        
        doctorImageView.image = UIImage(named: "image")
//        doctorImageView.layer.cornerRadius = view.frame.size.height/9
//        doctorImageView.layer.masksToBounds = true
//        doctorImageView.clipsToBounds = true
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

