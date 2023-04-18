//
//  ViewController.swift
//  view Controler
//
//  Created by R87 on 19/12/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.backgroundColor = .green
        nameTextField.textColor = .black
        nameTextField.text = "kaushik"
        nameTextField.layer.cornerRadius = 2
        nameTextField.layer.masksToBounds = true
        
        surNameTextField.backgroundColor = .black
        surNameTextField.textColor = .blue
        surNameTextField.text = "undhad"
        surNameTextField.layer.cornerRadius = 1
        surNameTextField.layer.masksToBounds = true
        
        
    }
   

    @IBAction func actionButtonTapped(_ sender: UIButton) {
        nameTextField.backgroundColor = .red
        surNameTextField.textColor = .yellow
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let alertViewControler: AlertViewController = storyBoard.instantiateViewController(withIdentifier: "AlertViewController") as! AlertViewController
        
//        navigationController?.present(alertViewControler, animated: true, completion: nil)
        navigationController?.pushViewController(alertViewControler, animated: true)
    }
    
}

