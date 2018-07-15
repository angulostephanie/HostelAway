//
//  HomeViewController.swift
//  HomeAwayHack
//
//  Created by Stephanie Angulo on 7/14/18.
//  Copyright © 2018 Stephanie Angulo. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource {
    
    var numberPeopleTextField: String = ""
    var locationTextField: String = ""
    var fromDateTextField: String = ""
    var toDateTextField: String = ""
    var maxPriceTextField: String = ""

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.rowHeight = 100
        print(numberPeopleTextField, locationTextField, fromDateTextField, toDateTextField, maxPriceTextField);
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  @IBAction func onDetailBtn(_ sender: Any) {
    self.performSegue(withIdentifier: "homeToDetailSegue", sender: nil)
  }
    let CellIdentifier = "listing"
    let data = ["something"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier, for: indexPath) as! ListingTableViewCell
        cell.titleText.text = data[indexPath.row]
        return cell
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
