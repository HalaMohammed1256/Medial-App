//
//  DoctorDataTableViewCell.swift
//  MedicalApplication
//
//  Created by Hala on 12/04/2021.
//

import UIKit

class DoctorDataTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var doctorImageView: UIImageView!
    @IBOutlet weak var doctorNameLabel: UILabel!
    @IBOutlet weak var dismissButton: UIButton!
    
    
    var dismissBottomSheetAction: (() -> Void)?
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func dismissBottomSheetTapped(_ sender: Any) {
        dismissBottomSheetAction?()
    }
    
    
    
}
