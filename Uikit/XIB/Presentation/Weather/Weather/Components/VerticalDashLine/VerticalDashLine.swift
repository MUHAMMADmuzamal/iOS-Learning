//
//  VerticalDashLine.swift
//  Weather
//
//  Created by codes orbit on 29/08/2023.
//

import UIKit
@IBDesignable
class VerticalDashLine: UIView {

    required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
        self.configureView()
     }

     override init(frame: CGRect) {
         super.init(frame: frame)
         self.configureView()
     }
    override func draw(_ rect: CGRect) {
        self.configureView()
    }
    
    func configureView() {
        drawDottedLine(start: CGPoint(x: self.bounds.minX, y: self.bounds.minY), end: CGPoint(x: self.bounds.minX, y: self.bounds.maxY ), view: self)

    }
    func drawDottedLine(start p0: CGPoint, end p1: CGPoint, view: UIView) {
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor(hex: "#C4C4C4", alpha: 1.0).cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.lineDashPattern = [7, 3] // 7 is the length of dash, 3 is length of the gap.

        let path = CGMutablePath()
        path.addLines(between: [p0, p1])
        shapeLayer.path = path
        view.layer.addSublayer(shapeLayer)
    }
}
