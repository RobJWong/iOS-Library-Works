//
//  Colors.swift
//  ColorGradient
//
//  Created by Robert Wong on 3/2/18.
//  Copyright © 2018 Robert Wong. All rights reserved.
//

import Foundation
import UIKit

class Colors {
    var gl:CAGradientLayer!
    
    init() {
        let colorTop = UIColor(red: 18.0 / 255.0, green: 174.0 / 255.0, blue: 188.0 / 255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 39.0 / 255.0, green: 98.0 / 255.0, blue: 205.0 / 255.0, alpha: 1.0).cgColor
        
        self.gl = CAGradientLayer()
        self.gl.colors = [colorTop, colorBottom]
        self.gl.locations = [0.0, 1.0]
    }
}


