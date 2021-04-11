//
//  VerificationPresenter.swift
//  MedicalApplication
//
//  Created by Hala on 10/04/2021.
//

import Foundation


protocol RoshtaVerificationView: class {
    func startAnimating()
    func stopAnimating()
}

protocol RoshtaVerificationViewPresenter {
    init(view: RoshtaVerificationView)
    var pharmacyPatientData: PharmacyPatientData? { get set }
    var statusCode: Int?{get set}
    func checkRoshtaCode(id: String)
}


class RoshtaVerificationPresenter: RoshtaVerificationViewPresenter {
    
    var statusCode: Int?
    
    var pharmacyPatientData: PharmacyPatientData?{
        didSet{
            if pharmacyPatientData?.status_code == 200{
                view?.stopAnimating()
            }else{
                statusCode = (pharmacyPatientData?.status_code)!
                view?.stopAnimating()
            }
        }
    }
    weak var view: RoshtaVerificationView?
    
    required init(view: RoshtaVerificationView) {
        self.view = view
    }
    
    func checkRoshtaCode(id: String) {
        
        view?.startAnimating()
        
        ApiServices.instance.getResponses(url: ApiUrls.PharmacyPatient.rawValue, id: id) {(data: PharmacyPatientData?, error) in
            
            guard let data = data, error == nil else{
                return
            }
            
            self.pharmacyPatientData = data
            
            
        }
    }
    
    
    
    
}
