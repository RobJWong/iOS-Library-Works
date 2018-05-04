//
//  ViewController.swift
//  ColorGradient
//
//  Created by Robert Wong on 3/2/18.
//  Copyright © 2018 Robert Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var testLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let text = "HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH!"
        testLabel.text = text
        let topLeftPointX = testLabel.frame.origin.x
        let topLeftPointY = testLabel.frame.origin.y
        let bottomRightPointX = testLabel.frame.maxX
        let bottomRightPointY = testLabel.frame.maxY
        
        let test1 = testLabel.convert(CGPoint(x: topLeftPointX, y: topLeftPointY), to: self.view)
         let test2 = testLabel.convert(CGPoint(x: bottomRightPointX, y: bottomRightPointY), to: self.view)
    
        if testLabel.applyGradientWith(startColor: UIColor.init(red: 39.0 / 255.0, green: 98.0 / 255.0, blue: 205.0 / 255.0, alpha: 1.0), endColor: UIColor.init(red: 18.0 / 255.0, green: 174.0 / 255.0, blue: 188.0 / 255.0, alpha: 1.0), tX: topLeftPointX, tY: topLeftPointY, bX: bottomRightPointX, bY: bottomRightPointY) {
            print("Gradient applied!")
        }
            
//        if testLabel.applyGradientWith(startColor: UIColor.init(red: 39.0 / 255.0, green: 98.0 / 255.0, blue: 205.0 / 255.0, alpha: 1.0), endColor: UIColor.init(red: 18.0 / 255.0, green: 174.0 / 255.0, blue: 188.0 / 255.0, alpha: 1.0), p1: test1, p2: test2) {
//            print("Gradient applied!")
//        }
        else {
            print("Could not apply gradient")
            testLabel.textColor = .black
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension UILabel {
    
//    func applyGradientWith(startColor: UIColor, endColor: UIColor) -> Bool {
//
//        var startColorRed:CGFloat = 39.0
//        var startColorGreen:CGFloat = 98.0
//        var startColorBlue:CGFloat = 205.0
//        var startAlpha:CGFloat = 1.0
//
//        if !startColor.getRed(&startColorRed, green: &startColorGreen, blue: &startColorBlue, alpha: &startAlpha) {
//            return false
//        }
    
    func applyGradientWith(startColor: UIColor, endColor: UIColor, tX: CGFloat, tY: CGFloat, bX: CGFloat, bY: CGFloat) -> Bool {
//    func applyGradientWith(startColor: UIColor, endColor: UIColor, p1: CGPoint, p2: CGPoint) -> Bool {
    
        var startColorRed:CGFloat = 0
        var startColorGreen:CGFloat = 0
        var startColorBlue:CGFloat = 0
        var startAlpha:CGFloat = 0
        
        if !startColor.getRed(&startColorRed, green: &startColorGreen, blue: &startColorBlue, alpha: &startAlpha) {
            return false
        }
        
        var endColorRed:CGFloat = 0
        var endColorGreen:CGFloat = 0
        var endColorBlue:CGFloat = 0
        var endAlpha:CGFloat = 0
        
        if !endColor.getRed(&endColorRed, green: &endColorGreen, blue: &endColorBlue, alpha: &endAlpha) {
            return false
        }
        
        let gradientText = self.text ?? ""
        
        let name:String = NSAttributedStringKey.font.rawValue
        let textSize: CGSize = gradientText.size(withAttributes: [NSAttributedStringKey(rawValue: name):self.font])
        let width:CGFloat = textSize.width
        let height:CGFloat = textSize.height
        
        UIGraphicsBeginImageContext(CGSize(width: width, height: height))
        
        guard let context = UIGraphicsGetCurrentContext() else {
            UIGraphicsEndImageContext()
            return false
        }
        
        UIGraphicsPushContext(context)
        
        let glossGradient:CGGradient?
        let rgbColorspace:CGColorSpace?
        let num_locations:size_t = 2
        let locations:[CGFloat] = [ 0.0, 1.0 ]
        let components:[CGFloat] = [startColorRed, startColorGreen, startColorBlue, startAlpha, endColorRed, endColorGreen, endColorBlue, endAlpha]
        rgbColorspace = CGColorSpaceCreateDeviceRGB()
        glossGradient = CGGradient(colorSpace: rgbColorspace!, colorComponents: components, locations: locations, count: num_locations)
        
        let topCenter = CGPoint.zero
        let bottomCenter = CGPoint(x: textSize.width, y: textSize.height)
        
//        let topCenter = CGPoint(x: 0 - tX, y: 0 - tY)
//        let bottomCenter = CGPoint(x: bX, y: bY)
        
//        let topCenter = p1
//        let bottomCenter = p2
        
        print("topCenter: ", topCenter)
        print("bottomCenter: ", bottomCenter)
        
        context.drawLinearGradient(glossGradient!, start: topCenter, end: bottomCenter, options: CGGradientDrawingOptions.drawsBeforeStartLocation)
        
        UIGraphicsPopContext()
        
        guard let gradientImage = UIGraphicsGetImageFromCurrentImageContext() else {
            UIGraphicsEndImageContext()
            return false
        }
        
        UIGraphicsEndImageContext()
        
        self.textColor = UIColor(patternImage: gradientImage)
        
        return true
    }
    
}
