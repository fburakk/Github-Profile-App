//
//  AlertVC.swift
//  githubProfile
//
//  Created by Burak Köse on 5.02.2023.
//

import UIKit

class AlertVC: UIViewController {

    let containerView = UIView()
    let alertTitleLabel = UILabel()
    let alertBodyLabel = UILabel()
    let alertActionButton = GPButton()
    
    var titleText: String?
    var messageText: String?
    var actionButtonText: String?
    var action: ((UIAction) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        
        configureContainerView()
        configureAlertTitleLabel()
        configureAlertActionButton()
        configureAlertBodyLabel()
    }
    
    init(titleText:String,messageText:String,actionButtonText:String,action:@escaping ((UIAction) -> Void)) {
        super.init(nibName: nil, bundle: nil)
        self.titleText = titleText
        self.messageText = messageText
        self.actionButtonText = actionButtonText
        self.action = action
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureContainerView() {
        view.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .secondarySystemBackground
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor.white.cgColor
        containerView.layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 220),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20)
        ])
    }
    
    func configureAlertTitleLabel() {
        view.addSubview(alertTitleLabel)
        alertTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        alertTitleLabel.text = titleText
        alertTitleLabel.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        alertTitleLabel.textAlignment = .center
        alertTitleLabel.textColor = .label
        alertTitleLabel.adjustsFontSizeToFitWidth = true
        alertTitleLabel.lineBreakMode = .byTruncatingTail
        
        NSLayoutConstraint.activate([
            alertTitleLabel.topAnchor.constraint(equalTo: containerView.topAnchor,constant: 20),
            alertTitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 20),
            alertTitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -20)
        ])
    }
    
    func configureAlertBodyLabel() {
        view.addSubview(alertBodyLabel)
        alertBodyLabel.translatesAutoresizingMaskIntoConstraints = false
        alertBodyLabel.text = messageText
        alertBodyLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        alertBodyLabel.numberOfLines = 0
        alertBodyLabel.minimumScaleFactor = 0.75
        alertBodyLabel.textAlignment = .center
        alertBodyLabel.textColor = .secondaryLabel
        alertBodyLabel.adjustsFontSizeToFitWidth = true
        alertBodyLabel.lineBreakMode = .byWordWrapping
        
        NSLayoutConstraint.activate([
            alertBodyLabel.topAnchor.constraint(equalTo: alertTitleLabel.bottomAnchor,constant: 5),
            alertBodyLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 20),
            alertBodyLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -20),
            alertBodyLabel.bottomAnchor.constraint(equalTo: alertActionButton.topAnchor,constant: -5)
        ])
    }
    
    func configureAlertActionButton() {
        view.addSubview(alertActionButton)
        alertActionButton.cornerRadius = 10
        alertActionButton.translatesAutoresizingMaskIntoConstraints = false
        alertActionButton.setTitle(actionButtonText, for: .normal)
        alertActionButton.backgroundColor = .systemPink
        alertActionButton.setTitleColor(.systemBackground, for: .normal)
        alertActionButton.addAction(UIAction(handler: action ?? { _ in self.dismiss(animated: true)}), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            alertActionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,constant: -20),
            alertActionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 25),
            alertActionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -25),
            alertActionButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

}
