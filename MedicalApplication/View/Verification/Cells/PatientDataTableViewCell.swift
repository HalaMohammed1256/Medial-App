//
//  PatientDataTableViewCell.swift
//  MedicalApplication
//
//  Created by Hala on 12/04/2021.
//

import UIKit

class PatientDataTableViewCell: UITableViewCell {
    
    @IBOutlet weak var patientNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
