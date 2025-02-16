//
//  BadgeView.swift
//  CollectionView
//
//  Created by Codes Orbit on 31/01/2025.
//

import UIKit

class BadgeView: UICollectionReusableView {
    
    @IBOutlet private weak var view:UIView!
    @IBOutlet private weak var label:UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        nibSetup()
    }
    
    func config(_ value: String) {
        self.label.text = value
    }
    
    func configure() {
        self.view.backgroundColor = UIColor.blue
        self.view.layer.borderColor = UIColor.black.cgColor
        self.view.layer.borderWidth = 1
        self.view.layer.cornerRadius = self.view.frame.height / 2
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
