//
//  HorizontalDashLine.swift
//  Weather
//
//  Created by codes orbit on 30/08/2023.
//

import UIKit
@IBDesignable
class HorizontalDashLine: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.drawLine()
    }
    
    required init?(coder aDecoder: NSCoder) {
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
        shapeLayer.strokeColor = UIColor(hex: "#C4C4C4", alpha: 1.0).cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.lineDashPattern = [7, 3] // 7 is the length of dash, 3 is length of the gap.

        let path = CGMutablePath()
        path.addLines(between: [
            CGPoint(x: self.bounds.minX, y: self.bounds.minY),
            CGPoint(x: self.bounds.maxX, y:  self.bounds.minY )])
        shapeLayer.path = path
        self.layer.addSublayer(shapeLayer)
    }

}
