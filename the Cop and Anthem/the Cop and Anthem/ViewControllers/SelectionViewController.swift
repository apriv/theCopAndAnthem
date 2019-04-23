//
//  SelectionViewController.swift
//  the Cop and Anthem
//
//  Created by April Zhou on 4/22/19.
//  Copyright © 2019 April Zhou. All rights reserved.
//

import UIKit

class SelectionViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITabBarControllerDelegate {
    

    @IBOutlet weak var Cells: ChoiceUiTableView!
    
    let places: [String] = ["Dine and dash",
                            "Break a showcase",
                            "Break the peace",
                            "Rob someone",
                            "Harass a lady",
                            "Walk around"]
    let cellReuseIdentifier = "cell"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create a new cell if needed or reuse an old one
        let cell:UITableViewCell = (self.Cells.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell?)!
        
        // set the text from the data model
        cell.textLabel?.text = self.places[indexPath.row]
        
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
        if (indexPath.row == 0){
            performSegue(withIdentifier: "toRestaurant", sender: self)
        }
        else if (indexPath.row == 1){
            performSegue(withIdentifier: "toShowcase", sender: self)
        }
        else if (indexPath.row == 2){
            performSegue(withIdentifier: "toStreetNight", sender: self)
        }
        else if (indexPath.row == 3){
            performSegue(withIdentifier: "toCigarShop", sender: self)
        }
        else if (indexPath.row == 4){
            performSegue(withIdentifier: "toShowcase2", sender: self)
        }
        else if (indexPath.row == 5){
            performSegue(withIdentifier: "toCathedral", sender: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register the table view cell class and its reuse id
        self.Cells.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        // (optional) include this line if you want to remove the extra empty cell divider lines
        // self.tableView.tableFooterView = UIView()
        
        // This view controller itself will provide the delegate methods and row data for the table view.
        Cells.delegate = self
        Cells.dataSource = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
