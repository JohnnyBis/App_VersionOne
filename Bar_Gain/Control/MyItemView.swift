//
//  MyItemView.swift
//  Bar_Gain
//
//  Created by Gianmaria Biselli on 12/2/17.
//  Copyright © 2017 Gianmaria Biselli. All rights reserved.
//

import UIKit

class MyItemView: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    @IBOutlet weak var imageBox: UIView!
    @IBOutlet weak var selectedImage: UIImageView!
    @IBOutlet weak var postButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Image picker setup
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        //Hidden back button on navigation bar
        navigationItem.hidesBackButton = true
        postButton.layer.cornerRadius = 5.0
        saveButton.layer.cornerRadius = 5.0
    }
    
    @IBAction func addPictureButtonPressed(_ sender: UIButton) {
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            selectedImage.contentMode = .scaleAspectFit
            selectedImage.image = pickedImage
        }
        imageBox.isHidden = true
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func addPostToFirebaseDB(userData: Dictionary<String, String>){
        DataService.ds.createFirebaseDBPosts(userData: userData)
    }
    
    @IBAction func postMyItemButtonPressed(_ sender: UIButton) {
        
        if AppDelegate.postData.count == 4{
            addPostToFirebaseDB(userData: AppDelegate.postData)
            
        }else{
            print("Fields not complete")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    

}
