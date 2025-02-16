//
//  HeaderFooterCell.swift
//  CollectionView
//
//  Created by Codes Orbit on 28/01/2025.
//

import UIKit

class HeaderFooterCell: UICollectionReusableView {

    static var identifier: String {
        String(describing: self)
    }
    
    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var view: UIView!
    
    static var nib: UINib {
        UINib(nibName: self.identifier, bundle: nil)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        nibSetup()
    }
    
    func config(_ title: String) {
        self.label.text = title
    }
}

extension HeaderFooterCell {
    private func nibSetup() {
        self.view = loadViewFromNib()
        self.view.frame = bounds
        self.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.translatesAutoresizingMaskIntoConstraints = true
        addSubview(view)
    }
    
    private func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return nibView
    }
}
