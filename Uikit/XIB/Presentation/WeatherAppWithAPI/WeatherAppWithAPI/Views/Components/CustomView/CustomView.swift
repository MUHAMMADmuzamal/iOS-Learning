//
//  CustomView.swift
//  Weather
//
//  Created by codes orbit on 28/08/2023.
//

import UIKit

@IBDesignable
class CustomView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureView()
     }

    func configureView() {
        guard let view = self.loadViewFromNib(nibName: "CustomView")else{return}
                    view.frame = bounds
                   view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
                    addSubview(view)
    }
    // MARK: all configureView Function work great. only add class to onwer of viewfile and add class to where this component called.
//    func configureView() {
//        let bundle = Bundle.init(for: CustomView.self)
//        if let viewToAdd = bundle.loadNibNamed("CustomView", owner: self),
//           let contentView = viewToAdd.first as? UIView{
//            addSubview(contentView)
//            contentView.frame = self.bounds
//            contentView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
//        }
//    }
//    func configureView() {
//
//            let nib = UINib(nibName: "CustomView", bundle: nil)
//
//            guard let view = nib.instantiate(withOwner: self, options: nil).first as?
//                                UIView else {fatalError("Unable to convert nib")}
//
//            view.frame = bounds
//            view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//
//            addSubview(view)
//
//        }
}

extension UIView{
    func loadViewFromNib(nibName: String) -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib  = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self).first as? UIView
    }
}

