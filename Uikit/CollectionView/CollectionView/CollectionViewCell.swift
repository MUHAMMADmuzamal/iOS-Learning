//
//  CollectionViewCell.swift
//  CollectionView
//
//  Created by Codes Orbit on 22/12/2024.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet private var label: UILabel!
    var height = 50.0
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.height = self.frame.height
    }
    
    static var identifier: String {
        return String(describing: Self.self)
    }
    static var nib: UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }

    
    func config(count: Int) {
        
//        self.label.text = "\(self.frame.height)-\(self.frame.width)"
    }
}
