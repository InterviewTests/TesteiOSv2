//
//  ViewController.swift
//  BankApp
//
//  Created by Adriano Rodrigues Vieira on 01/03/21.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.dismissKey()
        
        
        let parameters: [String: String] = [
            "user": "test_user",
            "password": "Test@1"
        ]
        let request = AF.request("https://bank-app-test.herokuapp.com/api/login",
                                        method: .post,
                                        parameters: parameters,
                                        encoder: URLEncodedFormParameterEncoder(destination: .httpBody))

        request.responseJSON { response in
            print("\(request.response!.statusCode) ")
        }
        
    }
}

