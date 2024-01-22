//
//  CollectionViewCell.swift
//  CollectionView
//
//  Created by codes orbit on 24/08/2023.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var label:UILabel!
    func configure(value:String) {
        label.text = value
        print(value)
    }
}
