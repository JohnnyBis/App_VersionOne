//
//  ViewController.swift
//  Bar_Gain
//
//  Created by Gianmaria Biselli on 9/8/17.
//  Copyright © 2017 Gianmaria Biselli. All rights reserved.
//
import UIKit
import Firebase
import FirebaseStorage
import Kingfisher

var postList = [Post]()
var itemIndex = 0

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource{
//    let userData = ["John", "Jeff", "Rob", "Rob", "John"]
//    let descriptionData = ["Item for sale here.", "Item for sale here.", "Item for sale here.", "Item for sale here.", "Item for sale here."]
//    let itemData = ["Table", "Painting", "Table", "Painting", "Table"]
    let imageData = ["image", "image1", "image", "image1", "image"]
    let profileImageData = ["profile", "profile", "profile", "profile", "profile"]

//    var refreshControl: UIRefreshControl = UIRefreshControl()
    
    //Variables:
//    @IBOutlet weak var textField: UITextField!
//    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var resultMenu: UITableView!
    @IBOutlet weak var imageLogo: UIImageView!
//    @IBOutlet weak var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        textField.borderStyle = .roundedRect
//        textField.textAlignment = .left
        
        resultMenu.delegate = self
        resultMenu.dataSource = self
        self.title = "TableView"
        let nibName = UINib(nibName: "CustomFeedCell", bundle: nil)
        resultMenu.register(nibName, forCellReuseIdentifier: "customCell")
        
        //Search Icon in Text Field
//        let leftImage = UIImageView()
//        let searchIcon = UIImage(named: "search")
//        leftImage.image = searchIcon
//
        //Set bounderies in Text Field
//        let contentView = UIView()
//        contentView.addSubview(leftImage)
//        contentView.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
//        leftImage.frame = CGRect(x: 10, y: 0, width: 10, height: 10)
//        textField.leftView = contentView
//        textField.leftViewMode = UITextFieldViewMode.always
//        retrieveData()
//        pullToRefresh()
          fetchData()
//        cancelButton.isHidden = true
        
    }
    
//    func configureSearchController() {
//        searchController = UISearchController(searchResultsController: nil)
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchData(){
        if Auth.auth().currentUser != nil{
            DataService.ds.REF_POSTS.addSnapshotListener { (querySnapshot, error) in
                guard let postChanges = querySnapshot else{
                    print("Error fetching document: \(error!)")
                    return
                }
                postChanges.documentChanges.forEach({ (diff) in
                    if diff.type == .added || diff.type == .modified || diff.type == .removed{
                        let documentID = diff.document.documentID as? String
                        let description = diff.document.data()["Description"] as? String
                        let title = diff.document.data()["Item Title"] as? String
                        let condition = diff.document.data()["Conditions"] as? String
                        let views = diff.document.data()["Views"] as? Int
                        if let url = diff.document.data()["Image Url"] as? String {
                            let post = Post(description: description, itemName: title, url: url, condition: condition, views: views, documentID: documentID)
                            postList.append(post)
                            DispatchQueue.main.async(execute: {
                                self.resultMenu.reloadData()
                            })

                        }else{
                            print("Image not found.")
                        }

                        print(postList)
                    }
                })

            }

        }else{
            print("Data fecth error: user could not be authenitcated.")
        }

    }
    
  
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        cancelButton.isHidden = false
//
//    }
//
//    @IBAction func cancelButtonPressed(_ sender: UIButton) {
//        view.endEditing(true)
//        cancelButton.isHidden = true
//    }
//
    
    //Text Field moves upword when user beings editing.
//    func textFieldDidBeginEditing(_ sender: UITextField) {
//        startEditing()
//
//    }
//
//    func startEditing(){
//        UIView.animate(withDuration: 1){
//            let logoframe = CGRect(x: self.imageLogo.frame.minX, y: -self.imageLogo.frame.height , width: self.imageLogo.frame.width, height: self.imageLogo.frame.height)
//            self.imageLogo.frame = logoframe
//            let fieldframe = CGRect(x: self.textField.frame.minX, y: 2*UIApplication.shared.statusBarFrame.height - 6, width: self.textField.frame.width, height: self.textField.frame.height)
//            self.textField.frame = fieldframe
//            self.view.layoutIfNeeded()
//        }
//
//        UIView.animate(withDuration: 1, delay: 1.5, animations: {
//            let resultFrame = CGRect(x: self.resultMenu.frame.minX, y: self.resultMenu.frame.minY, width: self.resultMenu.frame.width, height: 552)
//            self.resultMenu.frame = resultFrame
//            self.resultMenu.isHidden = false
//        })
//
//        let newImage = UIImage(named:"blue-wallpaper22")
//        UIView.transition(with: self.imageView,
//                          duration: 5,
//                          options: .transitionCrossDissolve,
//                          animations: { self.imageView.image = newImage },
//                          completion: nil)
//        imageView.contentMode = .center
//        }
    
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = resultMenu.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomFeedCell
        let post = postList[indexPath.row]
        cell.itemLabel.text = post.itemTitle
        cell.descriptionLabel.text = post.caption
        
        if let imageUrl = post.imageUrl {
            let url = URL(string: imageUrl)
            cell.itemImage.kf.setImage(with: url)
            
        }
     
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemIndex = indexPath.row
        performSegue(withIdentifier: "goToSelectedItemFromFeed", sender: self)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 165
    }


//    func pullToRefresh(){
//
//        refreshControl.addTarget(self, action: #selector(ViewController.retrieveData), for: UIControlEvents.valueChanged)
//        if #available(iOS 10.0, *){
//            resultMenu.refreshControl = refreshControl
//        }else{
//            resultMenu.addSubview(refreshControl)
//        }
//
//        refreshControl.endRefreshing()
//
//    }
    

    
}


