//
//  RoshtaTableDataTableViewCell.swift
//  MedicalApplication
//
//  Created by Hala on 12/04/2021.
//

import UIKit

class RoshtaTableDataTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var RoshtaTableView: UITableView!{
        didSet{
            RoshtaTableView.delegate = self
            RoshtaTableView.dataSource = self
        }
    }
    
    
    var RoshtaDetailsArray = [Rosheta](){
        didSet{
            DispatchQueue.main.async {
                self.RoshtaTableView.reloadData()
            }
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


extension RoshtaTableDataTableViewCell: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
    
    
}
