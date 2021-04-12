//
//  RoshtaCodeVerificationViewController+PatientRoshtaTableViewDelegats.swift
//  MedicalApplication
//
//  Created by Hala on 12/04/2021.
//

import UIKit



extension RoshtaCodeVerificationViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        var heightForRow : CGFloat = 0.0

        switch indexPath.section {
        case 0:
            heightForRow = tableView.frame.height*0.26    // upcoming collection view
        case 1:
            heightForRow = tableView.frame.height*0.1    // last table view

        case 2:
            heightForRow = tableView.frame.height*0.5    // team collection view
        default:
            heightForRow = 0.0
        }

        return heightForRow
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        var heightForHeader : CGFloat = 0.0

        switch section {
        case 0:
            heightForHeader = view.frame.height*0.05    // upcoming collection view
        case 1, 2:
            heightForHeader = view.frame.height*0.03    // last table view & team collection view
        default:
            heightForHeader = 0.0
        }

        return heightForHeader
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return 1
        
    }
    
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        var titleOfSections = ""
        
        switch section {
        case 0:
            titleOfSections = "Doctor Information"    // upcoming collection view
        case 1:
            titleOfSections = "Patient Information"    // last table view
            
        case 2:
            titleOfSections = "Roshta"    // team collection view
        default:
            titleOfSections = ""
        }
        
        return titleOfSections
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            
            guard let cell = patientRoshtaTableView.dequeueReusableCell(withIdentifier: String(describing: DoctorDataTableViewCell.self), for: indexPath)  as? DoctorDataTableViewCell else {
                return UITableViewCell()
            }
            
            
            cell.doctorImageView.image = UIImage(named: "image")
            cell.doctorNameLabel.text = roshtaVerificationPresenter!.pharmacyPatientData?.Details?.doctorName ?? "default"
            cell.dismissBottomSheetAction = {
                UIView.animate(withDuration: 0.3, animations: {
                    self.bottomSheetHeight.constant = 0.001
                    self.bottomSheetView.backgroundColor = MainColors.instance.primaryColor
                    self.patientRoshtaTableView.isHidden = true
                    
                    
                }) { (status) in
                    
                }
            }
            
            
            return cell
            
            
        case 1:
            
            guard let cell = patientRoshtaTableView.dequeueReusableCell(withIdentifier: String(describing: PatientDataTableViewCell.self), for: indexPath)  as? PatientDataTableViewCell else {
                return UITableViewCell()
            }
            
            
            cell.patientNameLabel.text = roshtaVerificationPresenter!.pharmacyPatientData?.Details?.patient_name
            
            return cell
      
        case 2:
            
            guard let cell = patientRoshtaTableView.dequeueReusableCell(withIdentifier: String(describing: RoshtaTableDataTableViewCell.self), for: indexPath)  as? RoshtaTableDataTableViewCell else {
                return UITableViewCell()
            }
            
//            cell.RoshtaDetailsArray = (roshtaVerificationPresenter!.pharmacyPatientData?.Details?.rosheta)!

            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
    
    
}


/*
 
 
 
 */
