//
//  AlertViewController.swift
//  view Controler
//
//  Created by R87 on 20/12/22.
//

import UIKit

class AlertViewController: UIViewController {
    
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var nametaxtField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
    }
    
    private func setup(){
        nametaxtField.text = "kaushik"
    }
    
    
    @IBAction func actionButtonTapped(_ sender: UIButton) {
        
        func displayvalidatin(messege: String){
            let alert: UIAlertController = UIAlertController(title: "Error", message: messege, preferredStyle: .alert)
            let okButton: UIAlertAction = UIAlertAction(title: "Okey", style: .default) { button in
            }
            let cancelButtton: UIAlertAction = UIAlertAction(title: "cancel", style: .default) { button in
                
            }
            
            alert.addAction(okButton)
            alert.addAction(cancelButtton)

        }
        
       
        displayActionSheet()
        
    }
    
    
    private func displayActionSheet(){
        let alert: UIAlertController = UIAlertController(title: "change", message: "multicolour", preferredStyle: .actionSheet)
        
        let redColour: UIAlertAction = UIAlertAction(title: "red colour", style: .default) { button in
            
            self.nametaxtField.backgroundColor = .yellow
            self.nametaxtField.textColor = .green
            self.view.backgroundColor = .red
        }
        
        let blueColour: UIAlertAction = UIAlertAction(title: "blue colour", style: .default) { button in
            
            self.nametaxtField.backgroundColor = .red
            self.nametaxtField.textColor = .yellow
            self.view.backgroundColor = .blue
        }
        
        let yellowColour: UIAlertAction = UIAlertAction(title: "yellow colour", style: .default) { button in
            
            self.nametaxtField.backgroundColor = .tintColor
            self.nametaxtField.textColor = .red
            self.view.backgroundColor = .yellow
            
        }
        let cancelButton: UIAlertAction = UIAlertAction(title: "NExt", style: .cancel)
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let imagePictureControler: ImageViewController = storyBoard.instantiateViewController(withIdentifier: "ImageViewController") as! ImageViewController
        navigationController?.present(imagePictureControler, animated: true, completion: nil)
        
       
        alert.addAction(redColour)
        alert.addAction(yellowColour)
        alert.addAction(blueColour)
        alert.addAction(cancelButton)
        
        present(alert, animated: true, completion: nil)
     
       
    }
    
    
}
