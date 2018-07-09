//
//  ProfileViewController.swift
//  Bar_Gain
//
//  Created by Gianmaria Biselli on 7/2/18.
//  Copyright © 2018 Gianmaria Biselli. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseStorage

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    let imagePicker = UIImagePickerController()
    var selectedImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        User.fetchUserData(uid: Global.variables.uid) { (user) in
            self.username.text = user.username
        }
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
       
        profileImage.layer.borderWidth = 1
        profileImage.layer.masksToBounds = false
        profileImage.layer.borderColor = UIColor.white.cgColor
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        profileImage.clipsToBounds = true
    }
    
    @IBAction func editButtonPressed(_ sender: UIButton) {
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    func uploadProfileImage(image: UIImage){
        FireStorageImageUpload().uploadImage(image, progressBlock: { (percentage) in
        }, completionBlock: { (fileUrl, error) in
            if error != nil{
                print("ERROR: " + error!)
            }
            print(Global.variables.uid)
            DataService.ds.REF_USERS.document(Global.variables.uid).updateData(["Image Url" : "\(fileUrl!)"], completion: { (error) in
                if error != nil{
                    print(error!)
                }
            })
        })
    }
    
//    func fetchProfileImage(){
//        User.fetchUserData(uid: Global.variables.uid) { (user) in
//
//        }
//    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
            profileImage.contentMode = .scaleAspectFill
            profileImage.image = pickedImage
            selectedImage = pickedImage
            uploadProfileImage(image: selectedImage)
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}
