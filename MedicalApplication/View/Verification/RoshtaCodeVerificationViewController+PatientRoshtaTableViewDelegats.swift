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
                heightForRow = tableView.frame.height*0.1

            case 1:
                heightForRow = tableView.frame.height*0.8
            default:
                heightForRow = 0.0
        }

        return heightForRow
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        var heightForHeader : CGFloat = 0.0

        switch section {
            case 0, 1:
                heightForHeader = view.frame.height*0.04
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
                titleOfSections = "PatientInformation".localized()
            case 1:
                titleOfSections = "Roshta".localized()
                 
            default:
                titleOfSections = ""
        }
        
        return titleOfSections
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {

        case 0:
            
            guard let cell = patientRoshtaTableView.dequeueReusableCell(withIdentifier: String(describing: PatientDataTableViewCell.self), for: indexPath)  as? PatientDataTableViewCell else {
                return UITableViewCell()
            }
            
            cell.backgroundColor = MainColors.instance.secondaryColor
            
            cell.patientNameLabel.text = roshtaVerificationPresenter!.pharmacyPatientData?.Details?.patient_name ?? "Patient name..."
            
            return cell
      
        case 1:
            
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


