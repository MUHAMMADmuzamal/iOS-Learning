//
//  TestComponent.swift
//  StackViewsPratice
//
//  Created by codes orbit on 31/08/2023.
//

import UIKit
@IBDesignable
class TestComponent: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.drawLine()
    }
    
    required init?(coder aDecoder:NSCoder){
        super.init(coder: aDecoder)
        self.drawLine()
    }
    
            // Only override draw() if you perform custom drawing.
            // An empty implementation adversely affects performance during animation.
            override func draw(_ rect: CGRect) {
                self.drawLine()
            }
    
            func drawLine() {
                let shapeLayer = CAShapeLayer()
                shapeLayer.strokeColor = UIColor.green.cgColor
                shapeLayer.lineWidth = 50
                shapeLayer.lineDashPattern = [7, 3] // 7 is the length of dash, 3 is length of the gap.
    
                let path = CGMutablePath()
                path.addLines(between: [
                    CGPoint(x: self.bounds.minX, y: self.bounds.minY),
                    CGPoint(x: self.bounds.maxX, y:  self.bounds.minY )])
                shapeLayer.path = path
                self.layer.addSublayer(shapeLayer)
            }

}
