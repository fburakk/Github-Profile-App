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
    
    @IBInspectable var cornerRadius: CGFloat = 10
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = cornerRadius
    }
    
}
