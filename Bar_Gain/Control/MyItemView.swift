//
//  MyItemView.swift
//  Bar_Gain
//
//  Created by Gianmaria Biselli on 12/2/17.
//  Copyright © 2017 Gianmaria Biselli. All rights reserved.
//

import UIKit
import FirebaseAuth

class MyItemView: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    @IBOutlet weak var imageBox: UIView!
    @IBOutlet weak var selectedImage: UIImageView!
    @IBOutlet weak var postButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
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
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
            selectedImage.contentMode = .scaleAspectFit
            selectedImage.image = pickedImage
            
            FireStorageImageUpload().uploadImage(pickedImage, progressBlock: { (percentage) in
                self.progressBar.setProgress(Float(percentage), animated: true)
            }, completionBlock: { (fileUrl, error) in
                if error != nil{
                    print(error!)
                }else{
                    AppDelegate.postData["Image Url"] = "\(fileUrl!)"
                    print(fileUrl!)
                }
            })
        }
        imageBox.isHidden = true
        dismiss(animated: true, completion: nil)
        
    }
    
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func addPostToFirebaseDB(userData: Dictionary<String, Any>){
        DataService.ds.createFirebaseDBPosts(userData: userData)
    }
    
    func addSavedPostToFirebaseDB(userData: Dictionary<String, Any>){
        DataService.ds.createFirebaseDBSavedPosts(userData: userData)
    }
    
    @IBAction func postMyItemButtonPressed(_ sender: UIButton) {
        let currentUser = Auth.auth().currentUser?.uid
        AppDelegate.postData[currentUser!] = true
        if AppDelegate.postData.count >= 4{
            addPostToFirebaseDB(userData: AppDelegate.postData)
            
            performSegue(withIdentifier: "goToMessageFromMyItem", sender: self)
           
        }else{
            print("Fields not complete")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func saveMyItemButtonPressed(_ sender: UIButton) {
        let currentUser = Auth.auth().currentUser?.uid
        AppDelegate.postData[currentUser!] = true
        if AppDelegate.postData.count >= 4{
            addSavedPostToFirebaseDB(userData: AppDelegate.postData)

            performSegue(withIdentifier: "goToMessageFromMyItem", sender: self)
            
        }else{
            print("Fields not complete")
        }
        
    }
    
    
    

}
