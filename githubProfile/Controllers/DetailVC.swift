//
//  DetailVC.swift
//  githubProfile
//
//  Created by Burak Köse on 6.02.2023.
//

import UIKit
import Kingfisher

class DetailVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NetworkManager.shared.makeRequest(endpoint: EndpointCases.getUser(username: K.username), type: User.self) { [self] result in
            switch result {
            case .success(let user):
                self.user = user
                tableView.reloadData()
            case .failure(let error):
                makeAlert(titleText: "Error!", messsageText: error.rawValue, actionButtonText: "Ok", action: { _ in
                    self.dismiss(animated: true)
                    self.navigationController?.popToRootViewController(animated: true)
                    
                })
            }
        }
    }
}

extension DetailVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! DetailCell
        cell.nameLabel.text = user?.name
        cell.usernameLabel.text = user?.login
        cell.bioLabel.text = user?.bio
        cell.followingLabel.text = "\(user?.following ?? 0)"
        cell.followersLabel.text = "\(user?.followers ?? 0)"
        cell.reposLabel.text = "\(user?.publicRepos ?? 0)"
        cell.pfp.kf.setImage(with: URL(string: user?.avatarUrl ?? ""))
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}
