//
//  DifferentHeightCell.swift
//  CollectionView
//
//  Created by Codes Orbit on 12/01/2025.
//

import UIKit

class DifferentHeightCell: UICollectionViewCell {

    @IBOutlet private weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var heightLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static var identifier: String {
        String(describing: self)
    }
    
    static var nib: UINib {
        UINib(nibName: self.identifier, bundle: nil)
    }
    
    func config(height: CGFloat) {
        self.heightConstraint.constant = height
        self.heightLabel.text = "\(height)"
    }

}
