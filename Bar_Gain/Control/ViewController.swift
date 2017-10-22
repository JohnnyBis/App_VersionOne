//
//  ViewController.swift
//  Bar_Gain
//
//  Created by Gianmaria Biselli on 9/8/17.
//  Copyright © 2017 Gianmaria Biselli. All rights reserved.
//
import UIKit
import Firebase

class ViewController: UIViewController, UITextFieldDelegate{
    
    
    //Variables:
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var resultMenu: UITableView!
    @IBOutlet weak var imageLogo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultMenu.isHidden = true
        //Text Field set as Delegate
        textField.delegate = self
        textField.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        
        //Search Icon in Text Field
        let leftImage = UIImageView()
        let searchIcon = UIImage(named: "search")
        leftImage.image = searchIcon
        
        //Set bounderies in Text Field
        let contentView = UIView()
        contentView.addSubview(leftImage)
        contentView.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        leftImage.frame = CGRect(x: 10, y: 0, width: 10, height: 10)
        textField.leftView = contentView
        textField.leftViewMode = UITextFieldViewMode.always
        
        DataService.ds.REF_POSTS.observe(.value) { (snapshot) in
            print(snapshot.value!)
        }
        
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //Text Field moves upword when user beings editing.
    func textFieldDidBeginEditing(_ sender: UITextField) {
        startEditing()
        
    }
    
    func startEditing(){
        UIView.animate(withDuration: 1){
            let logoframe = CGRect(x: self.imageLogo.frame.minX, y: -self.imageLogo.frame.height , width: self.imageLogo.frame.width, height: self.imageLogo.frame.height)
            self.imageLogo.frame = logoframe
            let fieldframe = CGRect(x: self.textField.frame.minX, y: 2*UIApplication.shared.statusBarFrame.height, width: self.textField.frame.width, height: self.textField.frame.height)
            self.textField.frame = fieldframe
            self.view.layoutIfNeeded()
            
        }
        
        UIView.animate(withDuration: 1, delay: 1.5, animations: {
            let resultFrame = CGRect(x: self.resultMenu.frame.minX, y: self.resultMenu.frame.minY, width: self.resultMenu.frame.width, height: 550)
            self.resultMenu.frame = resultFrame
            self.resultMenu.isHidden = false
            
        })
        
        let newImage = UIImage(named:"blue-wallpaper22")
        UIView.transition(with: self.imageView,
                          duration: 5,
                          options: .transitionCrossDissolve,
                          animations: { self.imageView.image = newImage },
                          completion: nil)
        imageView.contentMode = .center
        
        }
}
