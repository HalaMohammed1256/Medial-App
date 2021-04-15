//
//  RoshtaTableDataTableViewCell.swift
//  MedicalApplication
//
//  Created by Hala on 12/04/2021.
//

import UIKit

class RoshtaTableDataTableViewCell: UITableViewCell {
    
    var productName : [String : String] = [
        "ar":"",
        "en":""
    ]
    
    
    @IBOutlet weak var roshtaTableView: UITableView!{
        didSet{
            roshtaTableView.delegate = self
            roshtaTableView.dataSource = self
        }
    }
    
    
    var roshtaDetailsArray: [Rosheta]?{
        didSet{
            DispatchQueue.main.async {
                self.roshtaTableView.reloadData()
            }
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        self.roshtaTableView.tableFooterView = UIView.init(frame: CGRect.zero)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


extension RoshtaTableDataTableViewCell: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roshtaDetailsArray?.count ?? 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = roshtaTableView.dequeueReusableCell(withIdentifier: String(describing: RoshtaDataTableViewCell.self), for: indexPath)  as? RoshtaDataTableViewCell else {
            return UITableViewCell()
        }
        
        cell.layer.cornerRadius = 20
//        cell.backgroundColor = MainColors.instance.secondaryColor
        
        cell.drugImageView.sd_setImage(with: URL(string: roshtaDetailsArray?[indexPath.row].product?.mainImageUrl ?? ""), placeholderImage: UIImage(named: "medicine....."))
        
        cell.drugImageView.layer.cornerRadius = 10
        
        productName.updateValue(roshtaDetailsArray?[indexPath.row].product?.productNameEn ?? "drug name....", forKey: "en")
        productName.updateValue(roshtaDetailsArray?[indexPath.row].product?.productNameAr ?? "اسم الدواء....", forKey: "ar")
        
        
        cell.drugNameLabel.text = "productName".localized() == "en" ? productName["en"] : productName["ar"]
        cell.drugNotesLabel.text = roshtaDetailsArray?[indexPath.row].notes ?? "drug notes...."
        
        
        
        return cell
    }
    
    
    //.sd_setImage(with: URL(string: roshtaVerificationPresenter!.pharmacyPatientData?.Details?.image_doctor ?? ""), placeholderImage: UIImage(named: "doctor"))
    
}
