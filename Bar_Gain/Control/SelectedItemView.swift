//
//  SelectedItemView.swift
//  Bar_Gain
//
//  Created by Gianmaria Biselli on 1/11/18.
//  Copyright © 2018 Gianmaria Biselli. All rights reserved.
//

import UIKit
import FirebaseAuth

class SelectedItemView: UIViewController {
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var itemDescription: UILabel!
    @IBOutlet weak var itemCondition: UILabel!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var itemViews: UILabel!
    
    var post = postList[itemIndex]
    let dailyDate = NSDate()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemTitle.text = post.itemTitle
        itemTitle.sizeToFit()
        if let imageUrl = post.imageUrl{
            let url = URL(string: imageUrl)
            itemImage.kf.setImage(with: url)
            
        }
        itemCondition.text = post.condition
        itemDescription.text = post.caption
        itemDescription.sizeToFit()
        DailyViewsTimer()
        itemViews.sizeToFit()
        viewCounter()
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func DailyViewsTimer(){
        let currentDate = NSDate()
        let newDate = NSDate(timeInterval: 86400, since: currentDate as Date)
        UserDefaults.standard.setValue(newDate, forKey: "waitingDate")
        if let waitingDate:NSDate = UserDefaults.standard.value(forKey: "waitingDate") as? NSDate {
            if (dailyDate.compare(waitingDate as Date) == ComparisonResult.orderedDescending) {
                print("Reset views")
            }
            else {
                if let views = post.views {
                    itemViews.text = "Time post was seen \(views) times today."
                }else{
                    itemViews.isHidden = true
                    return
                    
                }
            }
        }
    }
    
    func viewCounter(){
        if Auth.auth().currentUser != nil {
            return
        }else{
            DataService().REF_POSTS.document(post.documentID!).updateData(["Views" : post.views! + 1]) { (error) in
                if error != nil{
                    print("Error")
                }else{
                    print("Successfully added one view")
                }
            }
        }
        
    }
    
    

        
    
    


}
