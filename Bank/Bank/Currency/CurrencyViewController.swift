import UIKit

protocol CurrencyDisplayLogic: class {
    func displayStatements(viewModel: Currency.StatementModel.ViewModel)
}

class CurrencyViewController: UIViewController, CurrencyDisplayLogic {
    var interactor: CurrencyBusinessLogic?
    var router: (NSObjectProtocol & CurrencyRoutingLogic & CurrencyDataPassing)?
    private let currencyView = CurrencyView()
    var statements = [Statement]()
    var user: User?
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = CurrencyInteractor()
        let presenter = CurrencyPresenter()
        let router = CurrencyRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func loadView() {

        view = currencyView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currencyView.tableView.delegate = self
        currencyView.tableView.dataSource = self
        
        user = router?.dataStore?.user
        currencyView.name = user?.name ?? ""
        currencyView.numberAccount = user?.accountFormat() ?? ""
        currencyView.balance = user?.balanceFormat() ?? ""
        
        if let userId = user?.userId {
            getStatements(userID: userId)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    // MARK: Do something
    
    fileprivate func getStatements(userID: String) {
        let request = Currency.StatementModel.Request(userID: userID)
        interactor?.getStatements(request: request)
    }
    
    func displayStatements(viewModel: Currency.StatementModel.ViewModel) {
        statements = viewModel.statements
        DispatchQueue.main.async {
            self.currencyView.tableView.reloadData()
        }
    }
}
