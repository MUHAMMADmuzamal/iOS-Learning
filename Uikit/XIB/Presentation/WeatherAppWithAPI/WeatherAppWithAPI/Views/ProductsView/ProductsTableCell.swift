//
//  ProductsTableCell.swift
//  WeatherAppWithAPI
//
//  Created by codes orbit on 05/09/2023.
//

import UIKit

class ProductsTableCell: UITableViewCell {

    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var descriptionLabel:UILabel!
    @IBOutlet weak var serialNumer:UILabel!
    static let identifier: String = "cell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func config(title:String, description:String, serialNumber: Int) {
        self.serialNumer?.text = "\(serialNumber)"
        self.titleLabel?.text = title
        self.descriptionLabel?.text = description
    }
    
}
