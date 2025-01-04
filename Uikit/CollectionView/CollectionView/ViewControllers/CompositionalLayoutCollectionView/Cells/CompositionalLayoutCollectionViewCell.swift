//
//  CompositionalLayoutCollectionViewCell.swift
//  CollectionView
//
//  Created by Codes Orbit on 04/01/2025.
//

import UIKit

class CompositionalLayoutCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var label: UILabel!
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

    func config(count: Int) {
        self.label.text = "\(count)"
    }
}
