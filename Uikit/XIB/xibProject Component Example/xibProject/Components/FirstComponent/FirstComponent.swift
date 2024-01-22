//
//  FirstComponent.swift
//  xibProject
//
//  Created by codes orbit on 24/08/2023.
//

import UIKit

class FirstComponent: UIView {
    @IBOutlet weak var label:UILabel!
    @IBOutlet weak var imageView:UIImageView!
    
    @IBOutlet weak var mainView:UIView!
    
    static var identifier = "FirstComponent"
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            initSubviews()
        }

        override init(frame: CGRect) {
            super.init(frame: frame)
            initSubviews()
        }

        func initSubviews() {
            let nib = UINib(nibName: FirstComponent.identifier, bundle: nil)

            guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else {fatalError("Unable to convert nib")}

            view.frame = bounds
            view.autoresizingMask = [.flexibleWidth, .flexibleHeight]

            addSubview(view)

        }
            
        func configureImageAndText(image : UIImage, text : String){
            label.text = text
            imageView.image = image
        }

}
