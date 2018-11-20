//
//  AlertUtils.swift
//  TesteiOSv2
//
//  Created by Felipe perius on 18/11/2018.
//  Copyright © 2018 Felipe Perius. All rights reserved.
//

import Foundation
import UIKit

class AlertUtils {

    class func showAlertErrorWithMessage(title: String, message: String, viewController: UIViewController?) {

        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

        let actOk = UIAlertAction(title: "OK", style: .default, handler: nil)

        alertController.addAction(actOk)

        if let view = viewController {
            view.present(alertController, animated: true, completion: nil)
        } else {
            let window = UIApplication.shared.keyWindow?.rootViewController
            window?.present(alertController, animated: true, completion: nil)
        }
    }

    class func showAlertError(title: String, viewController: UIViewController?) {

        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .alert)

        let actOk = UIAlertAction(title: "OK", style: .default, handler: nil)

        alertController.addAction(actOk)

        if let view = viewController {
            view.present(alertController, animated: true, completion: nil)
        } else {
            let window = UIApplication.shared.keyWindow?.rootViewController
            window?.present(alertController, animated: true, completion: nil)
        }
    }

    class func showAlertSuccess(title: String, message: String, viewController: UIViewController?) {

        let alertController = UIAlertController(title: "\(title)", message: message, preferredStyle: .alert)

        let actOk = UIAlertAction(title: "OK", style: .default) {
            _ in
            viewController?.dismiss(animated: true, completion: nil)
        }

        alertController.addAction(actOk)

        if let view = viewController {
            view.present(alertController, animated: true, completion: nil)
        }
    }

}

extension UIAlertController {

	class func alert(withTitle title: String, andMessage text: String?, andActions actions: [UIAlertAction], onController: UIViewController?) {

		guard let controller = onController else {
			return
		}

		guard let message = text else {
			return
		}

		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

		for action in actions {
			alert.addAction(action)
		}

		controller.present(alert, animated: true, completion: nil)
	}

}
