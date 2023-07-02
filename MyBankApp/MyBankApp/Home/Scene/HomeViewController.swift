import UIKit

final class HomeViewController: UIViewController {
    private let containerView = UIView()
    private let blueSquareView = UIView()
    private let exitButton = UIButton(type: .system)
    private let nameLabel = UILabel()
    private let accountLabel = UILabel()
    private let accountNumberLabel = UILabel()
    private let balanceLabel = UILabel()
    private let balanceValueLabel = UILabel()
    private let tableView = UITableView()
    
    var interactor: HomeBusinessLogic?
    var router: (NSObjectProtocol & HomeRoutingLogic & HomeDataPassing)?
    
    private var statements: [Statement] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        setupViews()
        setupUserInfo()
        interactor?.fetchUserStatements()
    }
    
    // MARK: SetupUI
    private func addSubviews() {
        view.addSubview(containerView)
        containerView.addSubview(blueSquareView)
        containerView.addSubview(exitButton)
        containerView.addSubview(nameLabel)
        containerView.addSubview(accountLabel)
        containerView.addSubview(accountNumberLabel)
        containerView.addSubview(balanceLabel)
        containerView.addSubview(balanceValueLabel)
        containerView.addSubview(tableView)
    }
    
    private func setupContainerView() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func setupSquareView() {
        blueSquareView.translatesAutoresizingMaskIntoConstraints = false
        blueSquareView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        blueSquareView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        blueSquareView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        blueSquareView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        blueSquareView.backgroundColor = UIColor(hex: "#3B49EE")
    }
    
    private func setupExitButton() {
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        exitButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 60).isActive = true
        exitButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20).isActive = true
        exitButton.widthAnchor.constraint(equalToConstant: 54).isActive = true
        exitButton.heightAnchor.constraint(equalToConstant: 54).isActive = true
        exitButton.setImage(UIImage(named: "ic-exitButton"), for: .normal)
        exitButton.tintColor = UIColor(hex: "#FFFFFF")
        if #available(iOS 14.0, *) {
            exitButton.addAction(UIAction(handler: { [weak self] _ in
                self?.exitButtonTapped()
            }), for: .touchUpInside)
        } else {
            // Check if iOS version is 11 or earlier
            if #available(iOS 12.0, *) {
                exitButton.addTarget(self, action: #selector(exitButtonTapped), for: .touchUpInside)
            } else {
                // Set a fallback action for iOS versions 11 or earlier
                exitButton.addTarget(self, action: #selector(exitButtonTapped), for: .touchDown)
            }
        }
    }
    
    private func setupUserNameLabel() {
        nameLabel.font = UIFont().set(.HelveticaNeueLight, size: 25)
        nameLabel.textColor = UIColor(hex: "#FFFFFF")
        nameLabel.text = "-"
    }
    
    private func setupUserNameLabelConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 60).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 18).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: exitButton.leadingAnchor, constant: -18).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 29).isActive = true
    }
    
    private func setupAccountLabel() {
        accountLabel.font = UIFont().set(.HelveticaNeue, size: 13)
        accountLabel.textColor = UIColor(hex: "#FFFFFF")
        accountLabel.text = "Conta"
    }
    
    private func setupAccountLabelConstraints() {
        accountLabel.translatesAutoresizingMaskIntoConstraints = false
        accountLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 28).isActive = true
        accountLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 18).isActive = true
        accountLabel.heightAnchor.constraint(equalToConstant: 13).isActive = true
    }
    
    private func setupAccountNumberLabel() {
        accountNumberLabel.font = UIFont().set(.HelveticaNeueLight, size: 25)
        accountNumberLabel.textColor = UIColor(hex: "#FFFFFF")
    }
    
    private func setupAccountNumberLabelConstraints() {
        accountNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        accountNumberLabel.topAnchor.constraint(equalTo: accountLabel.bottomAnchor, constant: 6).isActive = true
        accountNumberLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 18).isActive = true
        accountNumberLabel.heightAnchor.constraint(equalToConstant: 29).isActive = true
    }
    
    private func setupBalanceLabel() {
        balanceLabel.font = UIFont().set(.HelveticaNeue, size: 13)
        balanceLabel.textColor = UIColor(hex: "#FFFFFF")
        balanceLabel.text = "Saldo"
    }
    
    private func setupBalanceLabelConstraints() {
        balanceLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceLabel.topAnchor.constraint(equalTo: accountNumberLabel.bottomAnchor, constant: 21).isActive = true
        balanceLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 18).isActive = true
        balanceLabel.heightAnchor.constraint(equalToConstant: 13).isActive = true
    }
    
    private func setupBalanceValueLabel() {
        balanceValueLabel.font = UIFont().set(.HelveticaNeueLight, size: 25)
        balanceValueLabel.textColor = UIColor(hex: "#FFFFFF")
    }
    
    private func setupBalanceValueLabelConstraints() {
        balanceValueLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceValueLabel.topAnchor.constraint(equalTo: balanceLabel.bottomAnchor, constant: 6).isActive = true
        balanceValueLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 18).isActive = true
        balanceValueLabel.heightAnchor.constraint(equalToConstant: 29).isActive = true
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(StatementCell.self, forCellReuseIdentifier: "StatementCell")
    }
    
    private func setupTableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: blueSquareView.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
    }
    
    private func setupViews() {
        addSubviews()
        setupContainerView()
        setupSquareView()
        setupExitButton()
        setupUserNameLabel()
        setupUserNameLabelConstraints()
        setupAccountLabel()
        setupAccountLabelConstraints()
        setupAccountNumberLabel()
        setupAccountNumberLabelConstraints()
        setupBalanceLabel()
        setupBalanceLabelConstraints()
        setupBalanceValueLabel()
        setupBalanceValueLabelConstraints()
        setupTableView()
        setupTableViewConstraints()
    }
    
    private func setupUserInfo() {
        guard let user = router?.dataStore?.user else { return }
        nameLabel.text = user.name
        accountNumberLabel.text = user.accountNumber
        balanceValueLabel.text = user.balance
    }
    
    @objc private func exitButtonTapped() {
        router?.logout()
    }
}

// MARK: - HomeDisplayLogic Methods
extension HomeViewController: HomeDisplayLogic {
    func displayStatements(_ statements: [Statement]) {
        DispatchQueue.main.async {
            self.statements = statements
            self.tableView.reloadData()
        }
    }
    
    func displayStatementsError(message: String) {
        
    }
}

// MARK: - UITableView Methods
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StatementCell", for: indexPath) as? StatementCell else {
            fatalError("Failed to dequeue StatementCell")
        }
        
        let statement = statements[indexPath.row]
        cell.configure(with: statement)
        
        return cell
    }
}
