//
//  CollectionViewCell.swift
//  multipleVews
//
//  Created by codes orbit on 24/08/2023.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cellLabel:UILabel!
    func configure(value:String) {
        cellLabel.text = value
    }
}
