//
//  CollectionViewCell.swift
//  CollectionView
//
//  Created by Codes Orbit on 22/12/2024.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet private var height: NSLayoutConstraint!
    @IBOutlet private var width: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    static var identifier: String {
        return String(describing: Self.self)
    }
    static var nib: UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }

    
    func config(heightValue: CGFloat, widthValue: CGFloat ) {
        self.height.constant = heightValue
        self.width.constant =  widthValue
        print(heightValue, widthValue)
    }
}
