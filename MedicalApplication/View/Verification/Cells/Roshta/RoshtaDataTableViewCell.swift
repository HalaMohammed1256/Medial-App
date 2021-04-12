//
//  RoshtaDataTableViewCell.swift
//  MedicalApplication
//
//  Created by Hala on 12/04/2021.
//

import UIKit

class RoshtaDataTableViewCell: UITableViewCell {
    
    @IBOutlet weak var drugNameLabel: UILabel!
    @IBOutlet weak var drugTypeLabel: UILabel!
    @IBOutlet weak var drugNotesLabel: UILabel!
    @IBOutlet weak var drugImageView: UIImageView!
    @IBOutlet weak var drugIconImageView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
