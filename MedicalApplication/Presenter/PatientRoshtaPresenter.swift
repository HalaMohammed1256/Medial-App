//
//  PatientRoshtaPresenter.swift
//  MedicalApplication
//
//  Created by Hala on 11/04/2021.
//

import Foundation



protocol PatientRoshtaView: class {
    func startAnimating()
    func stopAnimating()
}

protocol PatientRoshtaViewPresenter {
    init(view: PatientRoshtaView)
    var PatientRoshtaData: PharmacyPatientData? { get set }
    func getPatientRoshtaDetails(id: String)
}


class PatientRoshtaPresenter: PatientRoshtaViewPresenter {
    
    var message: String?
    
    var PatientRoshtaData: PharmacyPatientData?{
        didSet{
            if PatientRoshtaData?.status_code == 200{
                view?.stopAnimating()
            }else{
                message = (PatientRoshtaData?.message)!
                view?.stopAnimating()
            }
        }
    }
    weak var view: PatientRoshtaView?
    
    required init(view: PatientRoshtaView) {
        self.view = view
    }
    
    func getPatientRoshtaDetails(id: String) {
        
        view?.startAnimating()
        
        ApiServices.instance.getResponses(url: ApiUrls.PharmacyPatient.rawValue, id: id) {(data: PharmacyPatientData?, error) in
            
            guard let data = data, error == nil else{
                return
            }
            
            self.PatientRoshtaData = data
            
            
        }
    }
    
    
    
    
}
