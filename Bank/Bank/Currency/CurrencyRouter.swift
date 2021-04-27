import UIKit

@objc protocol CurrencyRoutingLogic {
}

protocol CurrencyDataPassing {
    var dataStore: CurrencyDataStore? { get }
}

class CurrencyRouter: NSObject, CurrencyRoutingLogic, CurrencyDataPassing {
    weak var viewController: CurrencyViewController?
    var dataStore: CurrencyDataStore?
}
