//
//  UIViewController + Ext.swift
//  githubProfile
//
//  Created by Burak Köse on 5.02.2023.
//

import Foundation
import UIKit

extension UIViewController {
    
    func makeAlert(titleText:String,messsageText:String,actionButtonText:String,action:@escaping (UIAction) -> Void) {
        let alertVC = AlertVC(titleText: titleText, messageText: messsageText, actionButtonText: actionButtonText, action: action)
        alertVC.modalPresentationStyle = .overFullScreen
        alertVC.modalTransitionStyle = .crossDissolve
        self.present(alertVC, animated: true)
    }
}
