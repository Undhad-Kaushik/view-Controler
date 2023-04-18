//
//  ImageViewController.swift
//  view Controler
//
//  Created by R87 on 20/12/22.
//

import UIKit

class ImageViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    @IBOutlet weak var imagePickerView: UIImageView!
    @IBOutlet weak var imageButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setup()
        
        
    }
    
    private func setup(){
        [imagePickerView ,imageButton].forEach{
            setCornerRedius(view: $0, conerRadius: 10)
        }
    }
    
    func setCornerRedius(view: UIView?, conerRadius: CGFloat){
        view?.layer.cornerRadius = conerRadius
        view?.layer.masksToBounds = true
    }
    
    
    private func displayActionSheet(){
        let alert: UIAlertController = UIAlertController(title: "profile Picture", message: "please select Photo", preferredStyle: .alert)
        
        let cameraButton: UIAlertAction = UIAlertAction(title: "camera", style: .default) { button in
            
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                self.openCamera()
                //self.openImagePicker(sourceType: .camera)
            }else{
                self.displayAlert(message: "camera is not available")
            }
        }
        let galaryButton: UIAlertAction = UIAlertAction(title: "gallary", style: .default) { button in
            
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                self.openPhotos()
                //  self.openImagePicker(sourceType: .photoLibrary)
            }else{
                self.displayAlert(message: "gallery is not available")
            }
            
        }
        
        let cancelButton: UIAlertAction = UIAlertAction(title: "cancel", style: .cancel)
        
        alert.addAction(cameraButton)
        alert.addAction(galaryButton)
        alert.addAction(cancelButton)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    
    
    @IBAction func imageButtonTapped(_ sender: UIButton) {
        displayActionSheet()
    }
    
    private func openPhotos(){
        let imagePicker: UIImagePickerController = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
        
    }
     func openCamera(){
        let imagePicker: UIImagePickerController = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
//     func openImagePicker(sourceType: UIImagePickerController.SourceType){
//        let imagePicker: UIImagePickerController = UIImagePickerController()
//        imagePicker.delegate = self
//        imagePicker.sourceType = sourceType
//        imagePicker.allowsEditing = true
//        present(imagePicker, animated: true, completion: nil)
//    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo Info: [UIImagePickerController.InfoKey: Any]) {
        dismiss(animated: true, completion: nil)
        imagePickerView.image = Info[.editedImage] as? UIImage
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        dismiss(animated: true, completion: nil)
        print("Cancel Button Clicked")
    }
    
    
         func displayAlert(message: String){
        let alert: UIAlertController = UIAlertController(title: "error", message: message, preferredStyle: .alert)
        let okButton: UIAlertAction = UIAlertAction(title: "Ok", style: .default) { button in
            print("ok button tapped")
        }
        
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }
    
    
}
