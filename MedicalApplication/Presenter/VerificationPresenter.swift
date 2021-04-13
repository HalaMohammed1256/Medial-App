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
    func reloadTableView()
}

protocol RoshtaVerificationViewPresenter {
    init(view: RoshtaVerificationView)
    var pharmacyPatientData: PharmacyPatientData? { get set }
    func checkRoshtaCode(id: String, isLoadingCompletion : @escaping (Bool)->Void)
}


class RoshtaVerificationPresenter: RoshtaVerificationViewPresenter {
    
    
    var pharmacyPatientData: PharmacyPatientData?
//    {
//        didSet{
//            view?.stopAnimating()
//        }
//    }
    
    weak var view: RoshtaVerificationView?
    
    required init(view: RoshtaVerificationView) {
        self.view = view
    }
    
    func checkRoshtaCode(id: String, isLoadingCompletion : @escaping (Bool)->Void){
        view?.startAnimating()
        isLoadingCompletion(false)
        ApiServices.instance.getResponses(url: ApiUrls.PharmacyPatient.rawValue, id: id) {(data: PharmacyPatientData?, error) in
            
            guard let data = data, error == nil else{
                return
            }
            
            self.pharmacyPatientData = data
            if self.pharmacyPatientData?.status_code == 200{
                isLoadingCompletion(true)
                self.view?.reloadTableView()
            }

            self.view?.stopAnimating()
            
            
            
        }
    }
    
    
    
    
}
