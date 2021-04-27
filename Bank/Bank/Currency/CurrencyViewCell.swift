import UIKit

class CurrencyViewCell: UIView {
    
    private let stackViewMain = UIStackView()
    private let stackViewTop = UIStackView()
    private let stackViewButton = UIStackView()
    private let lblPay = UILabel()
    private let lblDate = UILabel()
    private let lblType = UILabel()
    private let lblValue = UILabel()
    
    var title: String {
        set {
            lblPay.text = newValue
        }
        get {
            lblPay.text ?? ""
        }
    }
    
    var desc: String {
        set {
            lblType.text = newValue
        }
        get {
            lblType.text ?? ""
        }
    }
    
    var value: String {
        set {
            lblValue.text = newValue
        }
        get {
            lblValue.text ?? ""
        }
    }
    
    var date: String {
        set {
            lblDate.text = newValue
        }
        get {
            lblDate.text ?? ""
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupHierarchy()
        setupLayout()
    }
    
    fileprivate func setupViews() {
        
        configView()
        configStackViewMain()
        configStackViewTop()
        configStackViewButton()
        configLblPay()
        configLblDate()
        configLblType()
        configLblValue()
    }
    
    fileprivate func setupHierarchy() {
        
        addSubview(stackViewMain)
        
        stackViewMain.addArrangedSubview(stackViewTop)
        stackViewMain.addArrangedSubview(stackViewButton)
        
        stackViewTop.addArrangedSubview(lblPay)
        stackViewTop.addArrangedSubview(lblDate)
        
        stackViewButton.addArrangedSubview(lblType)
        stackViewButton.addArrangedSubview(lblValue)
    }
    
    fileprivate func setupLayout() {
        
        stackViewMain.pinToSuperview(constant: 8)
    }
    
    fileprivate func configView() {
        
        backgroundColor = .white
        height(equalToConstant: 100)
    }
    
    fileprivate func configStackViewMain() {
        
        configStacks(stack: stackViewMain)
    }
    
    fileprivate func configStackViewTop() {
        
        configStacks(stack: stackViewTop, axis: .horizontal, distribution: .fill)
    }
    
    fileprivate func configStackViewButton() {
        
        configStacks(stack: stackViewButton, axis: .horizontal, distribution: .fill)
    }
    
    fileprivate func configLblPay() {
        
        configLabels(label: lblPay, text: title, color: UIColor(named: "currencyLabelsTopCell"))
    }
    
    fileprivate func configLblDate() {
        
        configLabels(label: lblDate, fontSize: 12, color: UIColor(named: "currencyLabelsTopCell"))
    }
    
    fileprivate func configLblType() {
        
        configLabels(label: lblType)
    }
    
    fileprivate func configLblValue() {
        
        configLabels(label: lblValue, text: value, fontSize: 20)
    }
    
    fileprivate func configLabels(label: UILabel, text: String = "", font: String = "HelveticaNeue", fontSize: CGFloat = 16, color: UIColor? = .black) {
        
        label.text = text
        label.textColor = color
        label.font = UIFont(name: font, size: fontSize)
    }
    
    fileprivate func configStacks(stack: UIStackView, alignment: UIStackView.Alignment = .fill, axis: NSLayoutConstraint.Axis = .vertical, spacing: CGFloat = 8, distribution: UIStackView.Distribution = .fillProportionally) {
        
        stack.alignment = alignment
        stack.axis = axis
        stack.spacing = spacing
        stack.distribution = distribution
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
