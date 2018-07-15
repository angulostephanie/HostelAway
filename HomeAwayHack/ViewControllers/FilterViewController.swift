//
//  FilterViewController.swift
//  HomeAwayHack
//
//  Created by Stephanie Angulo on 7/14/18.
//  Copyright © 2018 Stephanie Angulo. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {

    @IBOutlet weak var numberPeopleTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var fromDateTextField: UITextField!
    @IBOutlet weak var toDateTextField: UITextField!
    @IBOutlet weak var maxPriceTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is HomeViewController
        {
            let vc = segue.destination as? HomeViewController
            vc?.numberPeopleTextField = numberPeopleTextField.text ?? "2"
            vc?.locationTextField = locationTextField.text ?? "austin"
            vc?.fromDateTextField = fromDateTextField.text ?? "2018-07-20"
            vc?.toDateTextField = toDateTextField.text ?? "2018-07-22"
            vc?.maxPriceTextField = maxPriceTextField.text ?? "10000"
        }
    }
    
  @IBAction func goToListingPage(_ sender: Any) {
    //self.performSegue(withIdentifier: "filterToHomeSegue", sender: nil)
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
