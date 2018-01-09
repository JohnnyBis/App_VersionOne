//
//  AddItemTableView.swift
//  Bar_Gain
//
//  Created by Gianmaria Biselli on 11/15/17.
//  Copyright © 2017 Gianmaria Biselli. All rights reserved.
//

import UIKit
let placeholder = ["Insert your title", "Insert the conditions", "Select a shipping method", "Your description here"]
var myIndex = 0


class AddItemTableView: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    var identities = [String]()

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var imageBox: UIView!
    let imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        self.tabBarController?.tabBar.isHidden = true
        identities = ["TitleView","ConditionsView","ShippingView", "DescriptionView"]

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return addItemFields.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = itemFields.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = addItemFields[indexPath.row]
//        cell.accessoryType = .disclosureIndicator
//
//        return cell
//    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            itemImage.contentMode = .scaleAspectFit
            itemImage.image = pickedImage
        }
        imageBox.isHidden = true
        
        dismiss(animated: true, completion: nil)
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
////        myIndex = indexPath.row
//        let viewControllerName = identities[indexPath.row]
//        let viewController = storyboard?.instantiateViewController(withIdentifier: viewControllerName)
//        self.navigationController?.pushViewController(viewController!, animated: true)
//        itemFields.deselectRow(at: indexPath, animated: true)
//    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func addPicturePressed(_ sender: UIButton) {
        present(imagePicker, animated: true, completion: nil)

    }
    
    @IBAction func postButtonPressed(_ sender: UIButton) {
        addPostToFirebaseDB(userData: AppDelegate.postData)
        
    }
    
    func addPostToFirebaseDB(userData: Dictionary<String, Any>){
        DataService.ds.createFirebaseDBPosts(userData: userData)
    }
    
}
    

