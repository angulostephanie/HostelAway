//
//  HomeViewController.swift
//  HomeAwayHack
//
//  Created by Stephanie Angulo on 7/14/18.
//  Copyright © 2018 Stephanie Angulo. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource {
    
    var homeAwayAPICLient = HomeAwayAPICLient.shared
    var listings: ListingSearchPaginator?
    var entries: [ListingSearchHit] = []
    var loadingData = false;
    
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
        
        self.loadData();
    }
    
    func loadData() {
        self.loadingData = true;
        homeAwayAPICLient.search(locationTextField: locationTextField, numberPeopleTextField: numberPeopleTextField, maxPriceTextField: maxPriceTextField, fromDateTextField: fromDateTextField, toDateTextField: toDateTextField) { (ListingSearchPaginator) in
            guard
                let listings = ListingSearchPaginator
                else {
                    print("ERROR")
                    return
            }
            self.listings = listings
            if let entries = self.listings?.entries {
                self.entries = entries
                self.tableView.reloadData()
            }
            print(self.entries)
        }
        self.loadingData = false;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  @IBAction func onDetailBtn(_ sender: Any) {
    self.performSegue(withIdentifier: "homeToDetailSegue", sender: nil)
  }
    let CellIdentifier = "listing"
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier, for: indexPath) as! ListingTableViewCell
        cell.titleText.text = entries[indexPath.row].headline
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                            accessoryButtonTappedForRowWith indexPath: IndexPath) {
        self.performSegue(withIdentifier: "detailViewSegue", sender: nil)
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
