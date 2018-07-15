//
//  LoginViewController.swift
//  HomeAwayHack
//
//  Created by Stephanie Angulo on 7/14/18.
//  Copyright © 2018 Stephanie Angulo. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class LoginViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {
      
    var homeAwayAPICLient = HomeAwayAPICLient.shared

    override func viewDidLoad() {
      super.viewDidLoad()
        
//        homeAwayAPICLient.search(locationTextField: "austin", numberPeopleTextField: "6", maxPriceTextField: "1000", fromDateTextField: "2018-07-20", toDateTextField: "2018-07-30") { (ListingSearchPaginator) in
//            print(ListingSearchPaginator)
//        }
      
      GIDSignIn.sharedInstance().uiDelegate = self
      GIDSignIn.sharedInstance().delegate = self
      //GIDSignIn.sharedInstance().signOut()
      let buttonFrame : CGRect = CGRect.init(x: 0, y: 0, width: 100, height: 50)
      let gdSignInButton = GIDSignInButton.init(frame:buttonFrame)
        gdSignInButton.center = view.center
        view.addSubview(gdSignInButton)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLoginBtn(_ sender: Any) {
      print("signing in")
    }
  
   func sign(inWillDispatch signIn: GIDSignIn!, error: Error!) {
      guard error == nil else {
          print("Error while trying to redirect : \(error)")
          return
      }
      print("Successful Redirection")
    }


    //MARK: GIDSignIn Delegate

    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!)
    {
        if (error == nil) {
            // Perform any operations on signed in user here.
            let userId = user.userID                  // For client-side use only!
          print("User id is \(String(describing: userId))")

            let idToken = user.authentication.idToken // Safe to send to the server
          print("Authentication idToken is \(String(describing: idToken))")
            let fullName = user.profile.name
          print("User full name is \(String(describing: fullName))")
            let givenName = user.profile.givenName
          print("User given profile name is \(String(describing: givenName))")
            let familyName = user.profile.familyName
          print("User family name is \(String(describing: familyName))")
            let email = user.profile.email
          print("User email address is \(String(describing: email))")
          self.performSegue(withIdentifier: "loginToFilterSegue", sender: nil)
            // ...
        } else {
            print("ERROR ::\(error.localizedDescription)")
        }
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
