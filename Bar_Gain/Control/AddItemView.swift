//
//  AddItemView.swift
//  Bar_Gain
//
//  Created by Gianmaria Biselli on 10/4/17.
//  Copyright © 2017 Gianmaria Biselli. All rights reserved.
//

import UIKit
import FirebaseStorage
import FirebaseAuth
import Firebase


class AddItemView: UIViewController, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var conditionsTextField: UITextField!
    @IBOutlet weak var originTextField: UITextField!
    @IBOutlet weak var descriptionField: UITextView!
    @IBOutlet weak var numberCount: UILabel!
    @IBOutlet weak var imageBox: UIView!
    @IBOutlet weak var addPictureButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionField.delegate = self
        picker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let currentText = textView.text ?? ""
        guard let stringRange = Range(range, in: currentText) else {
            return false
        }
        let changedText = currentText.replacingCharacters(in: stringRange, with: text)
        numberCount.text = "\(changedText.count - 1)"
        return changedText.count <= 250
        
    }
    
    
    @IBAction func addPicturePressed(_ sender: UIButton) {
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("Canceled picker")
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var selectedImageFromPicker: UIImage?
        
        if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage{
            selectedImageFromPicker = originalImage
        }
        
        if let selectedImage = selectedImageFromPicker{
            itemImage.image = selectedImage
            dismiss(animated: true, completion: nil)
            addPictureButton.isHidden = true
        }
        
    }
    
    
    
    @IBAction func continueButtonPressed(_ sender: UIButton) {
//        uploadtoFIRStorage()
        addPostToFirebase()

    }
    
    
    func addPostToFirebase(){
        let description = descriptionField.text!
        let title = titleTextField.text!
        let origin = originTextField.text!
        let condition = conditionsTextField.text!
        let currentUser = Auth.auth().currentUser?.uid
        
        if Auth.auth().currentUser != nil{
            let postData = ["Title": title, "Origin": origin, "Condition": condition, "Description": description, currentUser!: true] as [String : Any]
            DataService.ds.createFirebaseDBPosts(userData: postData)
            dismiss(animated: true, completion: nil)
        }else{
            print("Error with user authentication")
        }
    }

    
    func uploadtoFIRStorage(){
        if Auth.auth().currentUser != nil{
            let imageName = NSUUID().uuidString
            let storageRef = Storage.storage().reference().child("\(imageName).png")
            if let uploadImage = UIImagePNGRepresentation(self.itemImage.image!){
                storageRef.putData(uploadImage, metadata: nil, completion: { (metadata, error) in
                    if error != nil {
                        print("Error: \(error!)")
                    }
                    print("Uploaded Succesfully - Metadata: \(metadata!)")
                    let downloadUrl = metadata?.downloadURL()?.absoluteURL
                    print(downloadUrl!)
                })
            
            }
            
        }else{
            print("Error with user authentication.")
        }
    }
    
    

    
}
