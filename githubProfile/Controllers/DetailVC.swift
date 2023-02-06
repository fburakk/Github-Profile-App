//
//  DetailVC.swift
//  githubProfile
//
//  Created by Burak Köse on 6.02.2023.
//

import UIKit

class DetailVC: UIViewController {

    var username: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = username
    }

}
