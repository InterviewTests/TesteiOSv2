//  Created by Fabio Souza de Morais on 12/05/19.
//  Copyright (c) 2019 Fabio Morais. All rights reserved.

import UIKit

protocol LoginPresentationLogic {
  func getSavedUserName(userName: String)
  func presentLogin(response: LoginModel.Login.Response)
  func showAlertError(error: String)
}

class LoginPresenter {
  weak var viewController: LoginDisplayLogic?
}

// MARK: - Privates Presentation Logic
extension LoginPresenter: LoginPresentationLogic {
  func getSavedUserName(userName: String) {
    viewController?.saveUserName(username: userName)
  }
  
  func presentLogin(response: LoginModel.Login.Response) {
    let viewModel = LoginModel.Login.ViewModel(name: response.user?.userAccount?.name ?? "", banckAccount: response.user?.userAccount?.bankAccount ?? "", agency: response.user?.userAccount?.agency ?? "", balance: response.user?.userAccount?.balance ?? 0.0)
    viewController?.getData(viewModel: viewModel)
  }
  
  func showAlertError(error: String) {
    viewController?.showAlertError(message: error)
  }
}
