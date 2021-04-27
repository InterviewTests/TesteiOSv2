import UIKit

class CurrencyView: UIView {
    
    private let viewTop = UIView()
    private let stackViewLabelsView = UIStackView()
    private let viewBackgroundLogout = UIView()
    private let imgViewLogout = UIImageView()
    private let stackViewTop = UIStackView()
    private let lblName = UILabel()
    private let stackViewLabelsAccount = UIStackView()
    private let lblAccount = UILabel()
    private let lblAccountValue = UILabel()
    private let stackViewLabelsBalance = UIStackView()
    private let lblBalance = UILabel()
    private let lblBalanceValue = UILabel()
    let tableView = UITableView()

    var name: String {
        set {
            lblName.text = newValue
        }
        get {
            lblName.text ?? ""
        }
    }
    
    var numberAccount: String {
        set {
            lblAccountValue.text = newValue
        }
        get {
            lblAccountValue.text ?? ""
        }
    }
    
    var balance: String {
        set {
            lblBalanceValue.text = newValue
        }
        get {
            lblBalanceValue.text ?? ""
        }
    }
    
    //var loginDelegate: LoginDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupHierarchy()
        setupLayout()
    }
    
    fileprivate func setupViews() {
        
        configViewTop()
        configStackViewLabelsView()
        configStackViewTop()
        configLblName()
        configViewBackgroundLogout()
        configImageViewLogout()
        configStackViewLabelsAccount()
        configLblAccount()
        configLblAccountValue()
        configStackViewLabelsBalance()
        configLblBalance()
        configLblBalanceValue()
        configTableView()
    }
    
    fileprivate func setupHierarchy() {
        
        addSubview(viewTop)
        
        viewTop.addSubview(stackViewLabelsView)
        viewTop.addSubview(stackViewTop)
        viewTop.addSubview(stackViewLabelsAccount)
        viewTop.addSubview(stackViewLabelsBalance)
        
        stackViewLabelsView.addArrangedSubview(stackViewTop)
        stackViewLabelsView.addArrangedSubview(stackViewLabelsAccount)
        stackViewLabelsView.addArrangedSubview(stackViewLabelsBalance)
        
        stackViewTop.addArrangedSubview(lblName)
        stackViewTop.addArrangedSubview(viewBackgroundLogout)
        viewBackgroundLogout.addSubview(imgViewLogout)
        
        stackViewLabelsAccount.addArrangedSubview(lblAccount)
        stackViewLabelsAccount.addArrangedSubview(lblAccountValue)
        
        stackViewLabelsBalance.addArrangedSubview(lblBalance)
        stackViewLabelsBalance.addArrangedSubview(lblBalanceValue)
        
        addSubview(tableView)
    }
    
    fileprivate func setupLayout() {
        
        viewTop.pinToSuperview(sides: [.top, .left, .right])
        
        stackViewLabelsView.pin(to: self.safeAreaLayoutGuide, sides: [.top])
        stackViewLabelsView.pinToSuperview(sides: [.left, .right, .bottom], constant: 24)
        
        imgViewLogout.centerToSuperview()

        tableView.bellow(to: viewTop)
        tableView.pin(to: self.safeAreaLayoutGuide, sides: [.bottom, .left, .right])
    }
    
    fileprivate func configBackground() {
        
        backgroundColor = .white
    }

    fileprivate func configViewTop() {
        
        viewTop.backgroundColor =  UIColor(named: "currencyViewTop")
        viewTop.height(equalToConstant: 250)
    }
    
    fileprivate func configStackViewLabelsView() {
        
        configStacks(stack: stackViewLabelsView, spacing: 16, distribution: .fillEqually)
    }
    
    fileprivate func configStackViewTop() {
        
        configStacks(stack: stackViewTop, axis: .horizontal)
    }
    
    fileprivate func configLblName() {
        
        configLabels(label: lblName, text: name, fontSize: 25)
    }
    
    fileprivate func configViewBackgroundLogout() {
        
        viewBackgroundLogout.backgroundColor = .clear
    }
    
    fileprivate func configImageViewLogout() {
        
        imgViewLogout.image = UIImage(named: "Logout")
        imgViewLogout.height(equalToConstant: 27)
        imgViewLogout.width(equalToConstant: 27)
    }
    
    fileprivate func configStackViewLabelsAccount() {
        
        configStacks(stack: stackViewLabelsAccount)
    }
    
    fileprivate func configLblAccount() {
        
        configLabels(label: lblAccount, text: NSLocalizedString("currency_account", comment: ""), fontSize: 12)
    }
    
    fileprivate func configLblAccountValue() {
        
        configLabels(label: lblAccountValue, text: numberAccount, fontSize: 25)
    }
    
    fileprivate func configStackViewLabelsBalance() {
        
        configStacks(stack: stackViewLabelsBalance)
    }
    
    fileprivate func configLblBalance() {
        
        configLabels(label: lblBalance, text: NSLocalizedString("currency_balance", comment: ""), fontSize: 12)
    }
    
    fileprivate func configLblBalanceValue() {
        
        configLabels(label: lblBalanceValue, text: balance, fontSize: 25)
    }
    
    fileprivate func configLabels(label: UILabel, text: String, font: String = "HelveticaNeue", fontSize: CGFloat, color: UIColor = .white) {
        
        label.text = text
        label.textColor = color
        label.font = UIFont(name: font, size: fontSize)
    }
    
    fileprivate func configStacks(stack: UIStackView, alignment: UIStackView.Alignment = .fill, axis: NSLayoutConstraint.Axis = .vertical, spacing: CGFloat = 4, distribution: UIStackView.Distribution = .fillProportionally) {
        
        stack.alignment = alignment
        stack.axis = axis
        stack.spacing = spacing
        stack.distribution = distribution
    }
    
    fileprivate func configTableView() {

        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView()
        tableView.register(CurrencyTableViewCell.self, forCellReuseIdentifier: CurrencyTableViewCell.reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
