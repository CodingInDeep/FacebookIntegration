//
//  ViewController.swift
//  FBLoginDemo
//
//  Created by Deep Mahajan.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController {
   
    //MARK:- Outlets
    @IBOutlet weak var lblLabel: UILabel!
    
    //MARK:- properties
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let token = AccessToken.current,
               !token.isExpired {
            let token = token.tokenString
            
            let request = FBSDKLoginKit.GraphRequest(graphPath: "me", parameters: ["field":"email,name"], tokenString: token, version: nil, httpMethod: .get)
            request.start { (connection, result, error) in
                print("\(result)")
            }}
        else{
            let loginButton = FBLoginButton()
                    loginButton.center = view.center
            loginButton.permissions = ["public_profile", "email"]
                    view.addSubview(loginButton)
        }
    }
    //MARK:- Actions
    @IBAction func btnFacebook(_ sender: Any) {
    }
    
    @IBAction func btnGoogle(_ sender: Any) {
    }
    
}

//MARK:- Supporting Fucntions and Methods
extension ViewController: LoginButtonDelegate {
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        let token = result?.token?.tokenString
        
        let request = FBSDKLoginKit.GraphRequest(graphPath: "me", parameters: ["field":"email,name"], tokenString: token, version: nil, httpMethod: .get)
        request.start { (connection, result, error) in
            print("\(result)")
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("Logout")
    }
}


