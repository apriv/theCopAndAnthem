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
    
    var places: [String] = ["Dine and dash",
                            "Break a showcase",
                            "//Break the peace",
                            "//Rob someone",
                            "Take advantage of a lady"]
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
        //create variable
        let defaults = UserDefaults.standard
        var img_bools = defaults.object(forKey: "stored_bool_list") as? [Bool] ?? [true,true,true,true,true,true,true,true,false]
        
        if (indexPath.row == 0){
            // change and store
            img_bools[1] = false
            defaults.set(img_bools, forKey: "stored_bool_list")
            print(img_bools)
            
            performSegue(withIdentifier: "toRestaurant", sender: self)
        }
        else if (indexPath.row == 1){
            // change and store
            img_bools[6] = false
            defaults.set(img_bools, forKey: "stored_bool_list")
            print(img_bools)
            
            performSegue(withIdentifier: "toShowcase2", sender: self)
        }
        else if (indexPath.row == 2){
            img_bools[4] = false
            defaults.set(img_bools, forKey: "stored_bool_list")
            print(img_bools)
            performSegue(withIdentifier: "toStreetNight", sender: self)
        }
        else if (indexPath.row == 3){
            img_bools[5] = false
            defaults.set(img_bools, forKey: "stored_bool_list")
            print(img_bools)
            performSegue(withIdentifier: "toCigarShop", sender: self)
        }
        else if (indexPath.row == 4){
            img_bools[2] = false
            img_bools[3] = false
            defaults.set(img_bools, forKey: "stored_bool_list")
            print(img_bools)
            performSegue(withIdentifier: "toShowcase", sender: self)
        }
        else if (indexPath.row == 5){
            img_bools[7] = false
            defaults.set(img_bools, forKey: "stored_bool_list")
            print(img_bools)
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
        
        
        // Set gesture to menu
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        let upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        upSwipe.direction = .up
        view.addGestureRecognizer(rightSwipe)
        view.addGestureRecognizer(upSwipe)
        
        // conditions to add a line
        let defaults = UserDefaults.standard
        var img_bools = defaults.object(forKey: "stored_bool_list") as? [Bool] ?? [true,true,true,true,true,true,true,true,false]
        if (!img_bools[1] && !img_bools[2] && !img_bools[6]){
            places.append("Walk Around")
        }

        
    }
    
    // function used for swipe back to menu
    @objc func handleSwipe(sender:UISwipeGestureRecognizer){
        if (sender.state == .ended){
            performSegue(withIdentifier: "toMenu", sender: self)
        }
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
