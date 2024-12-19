//
//  File.swift
//  SuperHeroes
//
//  Created by Tardes on 19/12/24.
//

import Foundation
import UIKit

extension UIProgressView{
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        let maskLayerPath = UIBezierPath(roundedRect: bounds, cornerRadius: 4.0)
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskLayerPath.cgPath
        layer.mask = maskLayer
    }
}
