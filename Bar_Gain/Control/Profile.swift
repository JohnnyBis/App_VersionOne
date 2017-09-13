//
//  Profile.swift
//  Bar_Gain
//
//  Created by Gianmaria Biselli on 9/11/17.
//  Copyright © 2017 Gianmaria Biselli. All rights reserved.
//

import UIKit
import QuartzCore

class Profile: UIViewController,UIScrollViewDelegate, UITableViewDelegate,UITableViewDataSource {
    
    

    @IBOutlet weak var userProfileImage: UIImageView!
    
    @IBOutlet var profilePageControl: UIPageControl!
    @IBOutlet var profileBodyView: UIStackView!
    
    @IBOutlet var scrollView: UIScrollView!
    var tableViewList:[UITableView]? = []
    
    var yPosition:CGFloat = 0
    var scrollViewContentSize:CGFloat=0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Configure profile image, name and details.
        userProfileImage.layer.cornerRadius = 25
        userProfileImage.clipsToBounds = true
        self.profileBodyView.translatesAutoresizingMaskIntoConstraints = false
        
        tableViewList?.append(TableView())
        tableViewList?.append(TableView())
        tableViewList?.append(TableView())
        tableViewList?.append(TableView())
        
        
        //Setup each tableView
        setUpTableViews()
        
        //Config of visualizers of page controll.
        configurePageControl()
        
        
        //Adding tableViews scroll view to profileBodyView.
        scrollView.delegate = self
        scrollView.showsHorizontalScrollIndicator = false
        self.profileBodyView.addSubview(scrollView)
        
        
        //Setup tables size for control.
        setUpForTables()
        // Do any additional setup after loading the view.
    }
    func configurePageControl() {
        // The total number of pages that are available is based on how many available colors we have.
        self.profilePageControl.numberOfPages = (tableViewList?.count)!
        self.profilePageControl.currentPage = 0
        self.profilePageControl.tintColor = UIColor.red
        self.profilePageControl.pageIndicatorTintColor = UIColor.black
        self.profilePageControl.currentPageIndicatorTintColor = UIColor.green
        
        
        
    }
    func setUpTableViews(){
        for tableView in tableViewList!{
            tableView.delegate = self
            tableView.dataSource = self
            tableView.backgroundColor = UIColor.clear
            tableView.estimatedRowHeight = 400
            tableView.rowHeight = UITableViewAutomaticDimension
            //With or without
            tableView.separatorStyle = .singleLine
            tableView.reloadData()
        }
    }
    func setUpForTables(){
        for  i in stride(from: 0, to: tableViewList!.count, by: 1) {
            
            //Sets the table size to fit scroll view.
            var frame = CGRect.zero
            frame.origin.x = self.scrollView.frame.size.width * CGFloat(i)
            frame.origin.y = 0
            frame.size = self.scrollView.frame.size
            self.scrollView.isPagingEnabled = true
            
            tableViewList![i].frame = frame
            
            scrollView.addSubview(tableViewList![i])
        }
        self.scrollView.contentSize = CGSize(width: self.scrollView.frame.size.width * CGFloat((tableViewList?.count)!), height: self.scrollView.frame.size.height)
        self.profilePageControl.addTarget(self, action: Selector(("changePage:")), for: UIControlEvents.valueChanged)
        
    }
  
    //On change page.
    func changePage(sender: AnyObject) -> () {
        let x = CGFloat(self.profilePageControl.currentPage) * scrollView.frame.size.width
        scrollView.setContentOffset(CGPoint(x: x,y :0), animated: true)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        profilePageControl.currentPage = Int(pageNumber)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle = .none
        
        let cellBackgroundView = UIView()
        //12 66 147
        cellBackgroundView.backgroundColor = UIColor(red: 12, green: 66, blue: 147, alpha: 1)
        cell.selectedBackgroundView = cellBackgroundView
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        cell.textLabel?.text = "Test table:"+(String(describing: tableViewList?.index(of: tableView) as! Int!))
        cell.textLabel?.text?.append(", Row: " + String(describing:indexPath.row))
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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
