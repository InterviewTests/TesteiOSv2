//
//  ShowStatementsViewController.swift
//  Bank-App-CleanSwift
//
//  Created by Adriano Rodrigues Vieira on 18/03/21.
//

import UIKit

class ShowStatementsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideNavigationBar()
        
        let statusBarView = UIView(frame: CGRect(x: 0, y: 0, width:UIScreen.main.bounds.width, height: UIApplication.shared.statusBarFrame.height))
        statusBarView.backgroundColor = UIColor.magenta
        self.navigationController?.view.addSubview(statusBarView)
        
        statusBarView.frame.height
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
