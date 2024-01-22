//
//  TableViewCellXib.swift
//  xibProject2
//
//  Created by codes orbit on 31/08/2023.
//

import UIKit

class TableViewCellXib: UITableViewCell {
    @IBOutlet weak var cellLabel:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
