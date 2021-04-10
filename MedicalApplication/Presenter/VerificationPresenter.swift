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
    func checkRoshtaCode()
}


class RoshtaVerificationPresenter: RoshtaVerificationViewPresenter {
    
    weak var view: RoshtaVerificationView?
    
    required init(view: RoshtaVerificationView) {
        self.view = view
    }
    
    func checkRoshtaCode() {
        //
    }
    
    
    
    
}
