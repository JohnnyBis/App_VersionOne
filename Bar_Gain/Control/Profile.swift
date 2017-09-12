//
//  Profile.swift
//  Bar_Gain
//
//  Created by Gianmaria Biselli on 9/11/17.
//  Copyright © 2017 Gianmaria Biselli. All rights reserved.
//

import UIKit

class Profile: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var userProfileImage: UIImageView!
    
    let imagelist = ["image1.jpg", "image1.jpg"]
    var scrollView = UIScrollView()
    
    var pageControl : UIPageControl = UIPageControl(frame:CGRect(x: 50, y: 300, width: 200, height: 50))
    
    var yPosition:CGFloat = 0
    var scrollViewContentSize:CGFloat=0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userProfileImage.layer.cornerRadius = 25
        userProfileImage.clipsToBounds = true
        
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 300))
        
        configurePageControl()
        
        scrollView.delegate = self
        self.view.addSubview(scrollView)
        for  i in stride(from: 0, to: imagelist.count, by: 1) {
            var frame = CGRect.zero
            frame.origin.x = self.scrollView.frame.size.width * CGFloat(i)
            frame.origin.y = 0
            frame.size = self.scrollView.frame.size
            self.scrollView.isPagingEnabled = true
            
            let myImage:UIImage = UIImage(named: imagelist[i])!
            let myImageView:UIImageView = UIImageView()
            myImageView.image = myImage
            myImageView.contentMode = UIViewContentMode.scaleAspectFit
            myImageView.frame = frame
            
            scrollView.addSubview(myImageView)
        }
        self.scrollView.contentSize = CGSize(width: self.scrollView.frame.size.width * CGFloat(imagelist.count), height: self.scrollView.frame.size.height)
        pageControl.addTarget(self, action: Selector(("changePage:")), for: UIControlEvents.valueChanged)
        // Do any additional setup after loading the view.
    }
    func configurePageControl() {
        // The total number of pages that are available is based on how many available colors we have.
        self.pageControl.numberOfPages = imagelist.count
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.red
        self.pageControl.pageIndicatorTintColor = UIColor.black
        self.pageControl.currentPageIndicatorTintColor = UIColor.green
        self.view.addSubview(pageControl)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func changePage(sender: AnyObject) -> () {
        let x = CGFloat(pageControl.currentPage) * scrollView.frame.size.width
        scrollView.setContentOffset(CGPoint(x: x,y :0), animated: true)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
