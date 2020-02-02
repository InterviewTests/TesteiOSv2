//
//  StatementViewController.swift
//  TesteiOSv2_ArlenPereira
//
//  Created by Arlen Ricardo Pereira on 28/01/20.
//  Copyright (c) 2020 Arlen Ricardo Pereira. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import JGProgressHUD
import KeychainSwift

protocol StatementDisplayLogic: class
{
    func displayUserInfo(viewModel: StatementsModel.UserInfoModel.ViewModel)
    func displayStatements(viewModel: StatementsModel.StatementsRequestModel.ViewModel)
}

class StatementViewController: UIViewController, StatementDisplayLogic
{
    // MARK: - Variable
    
    var interactor: StatementBusinessLogic?
    var router: (NSObjectProtocol & StatementRoutingLogic & StatementDataPassing)?
    
    let hud = JGProgressHUD(style: .dark)
    let tableViewCellId = "statementCell"
    let xibName = "StatementTableViewCell"
    var displayStatements: [StatementsModel.StatementsRequestModel.ViewModel.DisplayStatements] = []
    
    let keychain = KeychainSwift(keyPrefix: Keys.prefix)

  // MARK: - Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: - Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = StatementInteractor()
    let presenter = StatementsPresenter()
    let router = StatementRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: - Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: - View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    setNeedsStatusBarAppearanceUpdate()
    setupProgressHUD()
    let nib = UINib.init(nibName: xibName, bundle: nil)
    self.tableViewFrame.register(nib, forCellReuseIdentifier: tableViewCellId)
    self.tableViewFrame.rowHeight = 95
    
    fetchUserInfo()
  }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }

  // MARK: - Interface
    @IBOutlet weak var tableViewFrame: UITableView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var bankAccountLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    
  // MARK: - Function
    
    func setupProgressHUD() {
        hud.textLabel.text = "Loading"
    }
    
    func fetchUserInfo()
    {
        let request = StatementsModel.UserInfoModel.Request()
        interactor?.requestUserInfo(request: request)
    }

    func fetchStatements(userId: Int)
    {
        hud.show(in: self.view, animated: true)
        let request = StatementsModel.StatementsRequestModel.Request()
        interactor?.requestStatements(userId: userId, request: request)
    }

    func displayUserInfo(viewModel: StatementsModel.UserInfoModel.ViewModel)
    {
        userNameLabel.text = viewModel.name ?? "-"
        bankAccountLabel.text = "\(viewModel.bankAccount ?? "0000") / \(viewModel.agency ?? "0000000000")"
        balanceLabel.text = "R$ \(String(format:"%.2f", viewModel.balance ?? 0))"

        fetchStatements(userId: viewModel.userId ?? 0)
    }
    
    func displayStatements(viewModel: StatementsModel.StatementsRequestModel.ViewModel)
    {
        if !viewModel.message.isEmpty {
            hud.dismiss(afterDelay: 1.0, animated: true)
            self.alert(message: viewModel.message)
        } else if !viewModel.data.isEmpty {
            displayStatements.removeAll()
            for item in viewModel.data {
                displayStatements.append(item)
            }
            tableViewFrame.reloadData()
        }
        hud.dismiss(afterDelay: 1.0, animated: true)
    }

    // MARK: - Button
    @IBAction func backButton(_ sender: UIButton)
    {
        keychain.delete(Keys.username)
        self.dismiss(animated: true, completion: nil)
    }
}

// MARK: - Extension
extension StatementViewController: UITableViewDataSource, UITableViewDelegate
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return displayStatements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if let cell = tableViewFrame.dequeueReusableCell(withIdentifier: tableViewCellId, for: indexPath) as? StatementTableViewCell {
            let statementsResult = displayStatements[indexPath.row]
            cell.statementCell = statementsResult
            return cell
        }
        return UITableViewCell()
    }
}
