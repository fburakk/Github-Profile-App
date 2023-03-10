//
//  DetailCell.swift
//  githubProfile
//
//  Created by Burak Köse on 10.03.2023.
//

import UIKit

class DetailCell: UITableViewCell {

   
    @IBOutlet weak var pfp: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var reposLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    
    @IBOutlet weak var seeReposButton: GPButton!
    @IBOutlet weak var followButton: GPButton!
    @IBOutlet weak var seeWebsiteButton: GPButton!
    
    
}
