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
    @IBOutlet weak var enterRostaCodeTop: NSLayoutConstraint!
    
    
    // outlets
    @IBOutlet weak var patientRoshtaTableView: UITableView!{
        didSet{
            patientRoshtaTableView.delegate = self
            patientRoshtaTableView.dataSource = self
        }
    }
    
    
    
    @IBOutlet weak var doctorImageView: UIImageView!
    @IBOutlet weak var doctorNameLabel: UILabel!
    
    
    
    
    @IBOutlet weak var bottomSheetView: UIView!
    
    
    
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
    
    
    @IBAction func dismiss(_ sender: Any) {
        bottomSheetvisiability(isHidden: true)
    }
    
//    func fetchArticle(from url: String) async throws -> String
    
//    func fetchPharmacyPatientData(
    
    
    @IBAction func getRoshtaTapped(_ sender: Any) {
        
         
        roshtaID = String("\(firstNumberTextField.text!)\(secondNumberTextField.text!)\(thirdNumberTextField.text!)\(fourthNumberTextField.text!)\(fifthNumberTextField.text!)\(sixthNumberTextField.text!)")


        if roshtaID?.count == 6{

            guard let roshtaCode = roshtaID else{
                return
            }

            roshtaVerificationPresenter?.checkRoshtaCode(id: roshtaCode, isLoadingCompletion:{ isFinish in
                if isFinish && self.roshtaVerificationPresenter?.pharmacyPatientData?.status_code == 200{

                    
                    self.doctorNameLabel.text =  "Dr: \(self.roshtaVerificationPresenter!.pharmacyPatientData?.Details?.doctorName ?? "Doctor")"
                    self.doctorImageView.sd_setImage(with: URL(string: self.roshtaVerificationPresenter!.pharmacyPatientData?.Details?.image_doctor ?? ""), placeholderImage: UIImage(named: "doctor"))
                    
                    self.bottomSheetvisiability(isHidden: false)
                    self.clearTextField()

                }
//                if self.roshtaVerificationPresenter?.pharmacyPatientData?.status_code == 403{
//                    self.showAlert(title: "ERROR!", message: "\n\(self.roshtaVerificationPresenter?.pharmacyPatientData?.message ?? "please, enter a valid roshta code")", view: self)
//                }
            })


        }else {
            showAlert(title: "ERROR!", message: "\nRoshta code must be 6 digit numbers", view: self)
        }

    }


}


extension RoshtaCodeVerificationViewController: RoshtaVerificationView{
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.patientRoshtaTableView.reloadData()
            
        }
    }
    
    
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
/*
 
 doctorImageView.sd_setImage(with: URL(string: roshtaVerificationPresenter!.pharmacyPatientData?.Details?.image_doctor ?? ""), placeholderImage: UIImage(named: "doctor"))
 
 
 cell.doctorNameLabel.text = roshtaVerificationPresenter!.pharmacyPatientData?.Details?.doctorName ?? "Doctor"
 
 */


extension RoshtaCodeVerificationViewController{
    
    
    func bottomSheetvisiability(isHidden: Bool){
        UIView.animate(withDuration: 0.3, animations: {
//            self.bottomSheetHeight.constant = self.view.frame.height * 0.7
//            self.bottomSheetView.backgroundColor = MainColors.instance.secondaryColor
            self.bottomSheetView.isHidden = isHidden
            self.patientRoshtaTableView.isHidden = isHidden
            
        }) { (status) in
            
        }
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
        changeLanguageButton.tintColor = MainColors.instance.primaryColor
        getRoshtaButton.backgroundColor = MainColors.instance.primaryColor
        getRoshtaButton.tintColor = UIColor.white
        getRoshtaButton.layer.cornerRadius = 20
        
//        bottomSheetView.layer.borderColor = MainColors.instance.secondaryColor.cgColor
//        bottomSheetView.layer.borderWidth = 2
        bottomSheetView.layer.cornerRadius = 30
        
        doctorImageView.layer.cornerRadius = doctorImageView.frame.height/2
        doctorImageView.clipsToBounds = true
        
        enterRostaCodeTop.constant = view.frame.height * 0.087
        
        
    
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

