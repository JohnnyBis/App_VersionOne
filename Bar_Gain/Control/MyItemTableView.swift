//
//  MyItemTableView.swift
//  Bar_Gain
//
//  Created by Gianmaria Biselli on 12/2/17.
//  Copyright © 2017 Gianmaria Biselli. All rights reserved.
//

import UIKit
let fields = ["Item Title", "Conditions", "Shipping method", "Description"]
let fieldsSubtitle = ["Set your title.", "Set the conditions.", "Choose a shipping method", "Write some information."]

class MyItemTableView: UITableViewController{
    var identities = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        identities = ["TitleView","ConditionsView","ShippingView", "DescriptionView"]
        tableView.isScrollEnabled = false

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return fields.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewControllerName = identities[indexPath.row]
        let viewController = storyboard?.instantiateViewController(withIdentifier: viewControllerName)
        self.navigationController?.pushViewController(viewController!, animated: true)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyItemFieldCell
        cell.fieldTitle.text = fields[indexPath.row]
        cell.fieldTitle.sizeToFit()
        cell.fieldInput.text = fieldsSubtitle[indexPath.row]
        cell.fieldInput.sizeToFit()
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
