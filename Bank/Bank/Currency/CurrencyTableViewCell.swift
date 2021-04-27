import UIKit

class CurrencyTableViewCell: UITableViewCell, ReuseIdentifying {
    
    private let currencyViewCell = CurrencyViewCell()
    
    var title: String {
        set {
            currencyViewCell.title = newValue
        }
        get {
            currencyViewCell.title
        }
    }
    
    var value: String {
        set {
            currencyViewCell.value = newValue
        }
        get {
            currencyViewCell.value
        }
    }
    
    var desc: String {
        set {
            currencyViewCell.desc = newValue
        }
        get {
            currencyViewCell.desc
        }
    }
    
    var date: String {
        set {
            currencyViewCell.date = newValue
        }
        get {
            currencyViewCell.date
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    fileprivate func setupViews() {
        
        configCell()
    }
    
    fileprivate func setupHierarchy() {
        
        addSubview(currencyViewCell)
    }
    
    fileprivate func setupLayout() {
        
        currencyViewCell.pinToSuperview(sides: [.top, .bottom], constant: 8)
        currencyViewCell.pinToSuperview(sides: [.left, .right], constant: 16)
    }
    
    fileprivate func configCell() {
        
        height(equalToConstant: 100)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        currencyViewCell.layer.cornerRadius = 4
        currencyViewCell.layer.borderWidth = 1.0
        currencyViewCell.layer.borderColor = UIColor.white.cgColor
        currencyViewCell.layer.shadowColor = UIColor(named: "currencyLabelsTopCell")?.cgColor
        currencyViewCell.layer.shadowRadius = 3.0
        currencyViewCell.layer.shadowOpacity = 0.5
        currencyViewCell.layer.shadowOffset = CGSize(width:0, height: 2)
        currencyViewCell.layer.shadowPath = UIBezierPath(rect: currencyViewCell.bounds).cgPath
    }
}
