//
//  BookItViewController.swift
//  HomeAwayHack
//
//  Created by Kelly Lampotang on 7/14/18.
//  Copyright © 2018 Stephanie Angulo. All rights reserved.
//

import UIKit

class BookItViewController: UIViewController {

    @IBOutlet weak var bookItLabel: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func bookItClicked(_ sender: Any) {
        UIApplication.sharedApplication().openURL(NSURL(string: "http://www.vrbo.com")!)
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
