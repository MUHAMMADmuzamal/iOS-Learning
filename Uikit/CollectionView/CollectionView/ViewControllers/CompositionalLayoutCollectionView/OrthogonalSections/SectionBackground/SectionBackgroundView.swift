//
//  SectionBackgroundView.swift
//  CollectionView
//
//  Created by Codes Orbit on 30/01/2025.
//

import UIKit

class SectionBackgroundView: UICollectionReusableView {

    @IBOutlet private var view: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        nibSetup()
    }
    
    func configure() {
        self.view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        self.view.layer.borderColor = UIColor.black.cgColor
        self.view.layer.borderWidth = 1
        self.view.layer.cornerRadius = 12
    }
    
    private func nibSetup() {
        self.view = loadViewFromNib()
        self.view.frame = bounds
        self.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.translatesAutoresizingMaskIntoConstraints = true
        configure()
        addSubview(view)
    }
    
    private func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return nibView
    }
}
