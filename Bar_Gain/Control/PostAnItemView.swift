//
//  PostAnItemView.swift
//  Bar_Gain
//
//  Created by Gianmaria Biselli on 12/1/17.
//  Copyright © 2017 Gianmaria Biselli. All rights reserved.
//

import UIKit
import Kingfisher

class PostAnItemView: UIViewController, UINavigationControllerDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    @IBOutlet weak var postNowButton: UIButton!
    @IBOutlet weak var savedItems: UICollectionView!
    var savedPostList = [Post]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        postNowButton.layer.cornerRadius = 10.0
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        savedItems.delegate = self
        savedItems.dataSource = self
        savedItems.allowsSelection = true
        fetchSavedItems()
        
    }
    
    func fetchSavedItems(){
        
        Post.fetchSavedItems(savedPostList) { (post, error) in
            if error != nil{
                print(error!)
            }else{
                self.savedPostList.append(post!)
                DispatchQueue.main.async(execute: {
                    self.savedItems.reloadData()
                })
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return savedPostList.count
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = savedItems.dequeueReusableCell(withReuseIdentifier: "savedItemCell", for: indexPath) as! SavedPostCell
        let savedPost = savedPostList[indexPath.row]
        cell.itemTitle.text = savedPost.itemTitle
        
        if let imageUrl = savedPost.imageUrl{
            let url = URL(string: imageUrl)
            cell.itemImage.kf.setImage(with: url)
        }
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let segueName = "goToSavedItemFromSelection"
        performSegue(withIdentifier: segueName, sender: self)
        
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let cell = savedItems.dequeueReusableCell(withReuseIdentifier: "savedItemCell", for: indexPath) as! SavedPostCell
//        cell.itemTitle.sizeToFit()
//
//
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
