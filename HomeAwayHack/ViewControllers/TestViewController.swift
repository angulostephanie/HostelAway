//
//  TestViewController.swift
//  HomeAwayHack
//

//  Created by Stephanie Angulo on 7/14/18.
//  Copyright © 2018 Stephanie Angulo. All rights reserved.
//

import UIKit
import Firebase


class TestViewController: UIViewController {
//  var ref: DatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()
//        ref = Database.database().reference()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  @IBAction func addToFirebase(_ sender: Any) {
//    let user = User(firstName: "stephanie", lastName: "angulo", userID: "1234567890")
//    let test = Rental(maxPeople: 5, currentPeople: 4, host: user, rentalID: "987654321")
//    print(user.firstName)
//    self.ref.child("test").child("stephanie").setValue("angulo")
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
