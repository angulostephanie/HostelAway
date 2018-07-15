//
//  HomeViewController.swift
//  HomeAwayHack
//
//  Created by Stephanie Angulo on 7/14/18.
//  Copyright © 2018 Stephanie Angulo. All rights reserved.
//

import UIKit

class Entry {
    let title: String?
    let description: String?
    let price: Double?
    var image: UIImage?
    let numPeople: Int?
    
    init(title: String?, description: String?, price: Double?, image: UIImage?, numPeople: Int?) {
        self.title = title
        self.description = description
        self.price = price
        self.image = image
        self.numPeople = numPeople
    }
    
    public func setImage(_ image: UIImage) {
        self.image = image
    }
}

class HomeViewController: UIViewController, UITableViewDataSource {
  
    var indicator = UIActivityIndicatorView()

    var homeAwayAPICLient = HomeAwayAPICLient.shared
    var listings: ListingSearchPaginator?
    var entries: [ListingSearchHit] = []
    var entryCells: [Entry] = []
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
        tableView.rowHeight = 300
        print(numberPeopleTextField)
        self.loadData();
        self.title = "Homes Available"
    }
    
    func loadData() {
        self.loadingData = true;
//        self.indicator.startAnimating()
//        self.indicator.backgroundColor = UIColor.white
        homeAwayAPICLient.search(locationTextField: locationTextField, numberPeopleTextField: numberPeopleTextField, maxPriceTextField: maxPriceTextField, fromDateTextField: fromDateTextField, toDateTextField: toDateTextField) { (ListingSearchPaginator) in
            guard
                let listings = ListingSearchPaginator
                else {
                    print("ERROR")
                    return
            }
            self.listings = listings
            let group = DispatchGroup()
            if let entries = self.listings?.entries {
                self.entries = entries
                for entry in self.entries {
                    group.enter()
                    guard
                        let title = entry.headline,
                        let description = entry.description,
                        let price = entry.priceQuote?.amount
                        else {
                            return
                    }
                    if let uri = entry.thumbnail?.uri {
                        let imageURL = URL(string: uri)
                        if let imageURL =  imageURL {
                            self.homeAwayAPICLient.downloadImage(url: imageURL, completion: { (image, error) in
                                guard
                                    let image = image,
                                    error == nil
                                    else {
                                        return
                                }
                                DispatchQueue.main.async {
                                    self.entryCells.append(Entry(title: title, description: description, price: price, image: image, numPeople: Int(self.numberPeopleTextField)))
                                    print(self.entryCells)
                                    group.leave()
                                }
                            })
                        }
                    }
                }
            }
            group.notify(queue: .main) {
                self.tableView.reloadData()
            }
//            self.indicator.stopAnimating()
//            self.indicator.hidesWhenStopped = true
            self.loadingData = false;
        }
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
        cell.titleText.text = entryCells[indexPath.row].title
        cell.exampleImage.image = entryCells[indexPath.row].image
        if (entryCells[indexPath.row].price != nil) {
            let price = String(describing: entryCells[indexPath.row].price!)
            cell.priceLabel.text = "$\(price)"
        }
        if (entryCells[indexPath.row].numPeople != nil) {
            let numPeopleString = String(describing: entryCells[indexPath.row].numPeople!)
            cell.numSpots.text = "\(numPeopleString) people"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                            accessoryButtonTappedForRowWith indexPath: IndexPath) {
        self.performSegue(withIdentifier: "detailViewSegue", sender: nil)
    }
    func activityIndicator() {
      indicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
      indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
      indicator.center = self.view.center
      self.view.addSubview(indicator)
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
