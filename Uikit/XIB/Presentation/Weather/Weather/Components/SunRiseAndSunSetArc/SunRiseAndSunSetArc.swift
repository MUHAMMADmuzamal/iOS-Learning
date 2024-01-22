//
//  SunRiseAndSunSetArc.swift
//  Weather
//
//  Created by codes orbit on 30/08/2023.
//

import UIKit

@IBDesignable
class SunRiseAndSunSetArc: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    override func draw(_ rect: CGRect) {
        self.setup()
    }

    func setup() {
        
        // Create a CAShapeLayer
        let smallCurveShapeLayer = CAShapeLayer()
        
        // The Bezier path that we made needs to be converted to
        // a CGPath before it can be used on a layer.
        smallCurveShapeLayer.path = drawSmallCurve().cgPath
        
        
        // apply other properties related to the path
        smallCurveShapeLayer.strokeColor = UIColor.clear.cgColor
        smallCurveShapeLayer.fillColor = UIColor(hex: "#001F70", alpha: 1.0).cgColor
        smallCurveShapeLayer.lineWidth = 1.0
        smallCurveShapeLayer.position = CGPoint(x: 0, y: 0)
        
        // add the new layer to our custom view
        self.layer.addSublayer(smallCurveShapeLayer)
        
        //big curve
        let bigCurveShapeLayer = CAShapeLayer()
        bigCurveShapeLayer.strokeColor = UIColor.clear.cgColor
        bigCurveShapeLayer.fillColor = UIColor(hex: "#7CC9F2", alpha: 1.0).cgColor
        bigCurveShapeLayer.lineWidth = 1.0
        bigCurveShapeLayer.position = CGPoint(x: 0, y: 0)
        bigCurveShapeLayer.path = drawBigCurve().cgPath
        self.layer.addSublayer(bigCurveShapeLayer)

    }
    
    
    private func drawSmallCurve() -> UIBezierPath {
        
        // create a new path
        let path = UIBezierPath()
        path.move(to: CGPoint(x:-10,y:50))
        path.addCurve(to: CGPoint(x: 40, y: 50), // ending point
               controlPoint1: CGPoint(x: 10, y:   77),
               controlPoint2: CGPoint(x: 20, y:  77))
        
        
        // close the path. This will create the last line automatically.
        path.close()
        
        return path
    }
    func drawBigCurve() -> UIBezierPath {
        
        // create a new path
        let path = UIBezierPath()
        path.move(to: CGPoint(x:40,y:50))
        path.addCurve(to: CGPoint(x: 188 + 40, y: 50), // ending point
               controlPoint1: CGPoint(x: 60 + 40, y: -20),
               controlPoint2: CGPoint(x: 120 + 40, y: -20))
        path.close()
        return path
    }
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexValue = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()

        if hexValue.hasPrefix("#") {
            hexValue.remove(at: hexValue.startIndex)
        }

        var rgbValue: UInt64 = 0
        Scanner(string: hexValue).scanHexInt64(&rgbValue)

        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
