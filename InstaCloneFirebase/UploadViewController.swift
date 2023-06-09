//
//  UploadViewController.swift
//  InstaCloneFirebase
//
//  Created by Meltem Uğurlu on 22.05.2023.
//

import UIKit
import Firebase

class UploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var commentText: UITextField!
    
    @IBOutlet weak var uploadButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.isUserInteractionEnabled = true
        let gestureRecoginzer = UITapGestureRecognizer(target: self, action: #selector(chooseImage))
        imageView.addGestureRecognizer(gestureRecoginzer)
        
    }
    
    @objc func chooseImage(){
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    func makeAlert(titleInput: String , messageInput: String){
      let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
      let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
      alert.addAction(okButton)
      self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func uploadButtonClicked(_ sender: Any) {
        
        let storage = Storage.storage()
        let storageReference = storage.reference()
        
        let medaiFolder = storageReference.child("media")
        
        if let data = imageView.image?.jpegData(compressionQuality: 0.5){
            
            let uuid = UUID().uuidString
            
            let imageReference = medaiFolder.child("\(uuid).jpg")
            imageReference.putData(data, metadata: nil) {(metadata, error) in
                if error != nil {
                    self.makeAlert(titleInput: "Error !", messageInput: error?.localizedDescription ?? "Error")

                }else{
                    
                    imageReference.downloadURL { (url, error) in
                        if error == nil {
                            let imageUrl =  url?.absoluteString
                             
                            //Database
                            
                        }
                        
                    }
                }
                
            }
            
        }
        
    }
    

}
