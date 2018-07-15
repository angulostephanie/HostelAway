//
//  ViewRequestViewController.swift
//  HomeAwayHack
//
//  Created by Kelly Lampotang on 7/14/18.
//  Copyright © 2018 Stephanie Angulo. All rights reserved.
//

import UIKit

class ViewRequestViewController: UIViewController, UITableViewDataSource {

    let entries = ["Request from Bonnie", "Request from Ming", "Request from Stephanie", "Request from Gregory", "Request from Kelly", "Request from Pedro", "Request from Sanodval"]
    @IBOutlet weak var requestTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.requestTableView.dataSource = self
        self.requestTableView.reloadData()
        
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "request", for: indexPath) as! RequestTableViewCell
        cell.backgroundColor = UIColor.white
        cell.requestLabel.text = entries[indexPath.row]
        return cell
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
