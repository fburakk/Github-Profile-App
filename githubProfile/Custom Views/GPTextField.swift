//
//  GPTextField.swift
//  githubProfile
//
//  Created by Burak Köse on 5.02.2023.
//

import Foundation
import UIKit

@IBDesignable
class GPTextField: UITextField {
    @IBInspectable var cornerRadius: CGFloat = 10
    @IBInspectable var borderColor: CGColor = UIColor.systemGray4.cgColor
    @IBInspectable var borderWidth: CGFloat = 1
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = cornerRadius
        layer.borderColor = borderColor
        layer.borderWidth = borderWidth
    }
    
}
