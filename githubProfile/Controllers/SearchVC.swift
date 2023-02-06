//
//  ViewController.swift
//  githubProfile
//
//  Created by Burak Köse on 4.02.2023.
//

import UIKit

class SearchVC: UIViewController {

    @IBOutlet weak var textField: GPTextField!
    
    var isUsernameEntered: Bool {
        return !textField.text!.isEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        createGestureRecognizer()
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
        
        if let _ = textField.text {
            performSegue(withIdentifier: K.segueID.toDetail, sender: nil)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.segueID.toDetail {
            let desVC = segue.destination as! DetailVC
            desVC.username = textField.text!
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

