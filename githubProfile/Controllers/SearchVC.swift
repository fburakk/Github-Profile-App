//
//  ViewController.swift
//  githubProfile
//
//  Created by Burak Köse on 4.02.2023.
//

import UIKit

class SearchVC: UIViewController {

    @IBOutlet weak var textField: GPTextField!
    private var user: User?
    
    var isUsernameEntered: Bool {
        return !textField.text!.isEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        createGestureRecognizer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        textField.text = ""
    }
    
    func configure() {
        textField.delegate = self
    }
    
    func createGestureRecognizer() {
        let GR = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(GR)
    }

    @IBAction func searchButton(_ sender: Any) {
        guard isUsernameEntered else {
            makeAlert(titleText: "Empty Username", messsageText: "Please enter a username😅", actionButtonText: "OK") { _ in self.dismiss(animated: true)}
            return
        }
        
        if let username = textField.text as? String {
            K.username = username
            performSegue(withIdentifier: K.segueID.toDetail, sender: nil)
        }
    }
}

extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //search
        view.endEditing(false)
        return true
    }
}

