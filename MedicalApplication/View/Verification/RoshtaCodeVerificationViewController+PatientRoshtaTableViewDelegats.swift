//
//  RoshtaCodeVerificationViewController+PatientRoshtaTableViewDelegats.swift
//  MedicalApplication
//
//  Created by Hala on 12/04/2021.
//

import UIKit
import SDWebImage



extension RoshtaCodeVerificationViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        var heightForRow : CGFloat = 0.0

        switch indexPath.section {
            case 0:
                heightForRow = tableView.frame.height*0.36
            case 1:
                heightForRow = tableView.frame.height*0.1

            case 2:
                heightForRow = tableView.frame.height*0.5
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
            case 0, 1, 2:
                heightForHeader = view.frame.height*0.03
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
                titleOfSections = "Doctor Information"
            case 1:
                titleOfSections = "Patient Information"
                
            case 2:
                titleOfSections = "Roshta"    
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
            
//            cell.backgroundColor = UIColor(patternImage: UIImage(named: "capsules")!)
            
            cell.doctorImageView.sd_setImage(with: URL(string: roshtaVerificationPresenter!.pharmacyPatientData?.Details?.image_doctor ?? ""), placeholderImage: UIImage(named: "doctor"))
            
            cell.doctorImageView.layer.cornerRadius = cell.doctorImageView.frame.height/2
            cell.doctorImageView.clipsToBounds = true
            
            cell.doctorNameLabel.text = roshtaVerificationPresenter!.pharmacyPatientData?.Details?.doctorName ?? "Doctor"
            
            
            return cell
            
            
        case 1:
            
            guard let cell = patientRoshtaTableView.dequeueReusableCell(withIdentifier: String(describing: PatientDataTableViewCell.self), for: indexPath)  as? PatientDataTableViewCell else {
                return UITableViewCell()
            }
            
            
            cell.patientNameLabel.text = roshtaVerificationPresenter!.pharmacyPatientData?.Details?.patient_name ?? "Patient"
            
            return cell
      
        case 2:
            
            guard let cell = patientRoshtaTableView.dequeueReusableCell(withIdentifier: String(describing: RoshtaTableDataTableViewCell.self), for: indexPath)  as? RoshtaTableDataTableViewCell else {
                return UITableViewCell()
            }
            
            cell.roshtaDetailsArray = roshtaVerificationPresenter!.pharmacyPatientData?.Details?.rosheta

            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
    
    
}


/*
 
 
 
 */
