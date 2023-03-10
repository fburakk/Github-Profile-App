//
//  GPButton.swift
//  githubProfile
//
//  Created by Burak Köse on 5.02.2023.
//

import Foundation
import UIKit

@IBDesignable
class GPButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 10 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor = .blue {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 1 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
}

