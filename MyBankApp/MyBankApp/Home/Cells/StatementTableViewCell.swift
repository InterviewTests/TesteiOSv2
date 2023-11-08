import UIKit

final class StatementCell: UITableViewCell {
    private let backgroundContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        return view
    }()
    
    private let typeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont().set(.HelveticaNeue, size: 16)
        label.textColor = UIColor(hex: "#A8B4C4")
        return label
    }()
    
    private let detailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont().set(.HelveticaNeue, size: 16)
        label.textColor = UIColor(hex: "#485465")
        label.numberOfLines = 0
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont().set(.HelveticaNeue, size: 16)
        label.textColor = UIColor(hex: "#A8B4C4")
        return label
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont().set(.HelveticaNeue, size: 20)
        label.textColor = UIColor(hex: "#485465")
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with statement: Statement) {
        typeLabel.text = statement.type
        detailLabel.text = statement.detail
        dateLabel.text = statement.date.convertToValidDate()
        valueLabel.text = statement.value.formatCurrency()
    }
    
    private func addSubviews() {
        contentView.addSubview(backgroundContainerView)
        backgroundContainerView.addSubview(typeLabel)
        backgroundContainerView.addSubview(detailLabel)
        backgroundContainerView.addSubview(dateLabel)
        backgroundContainerView.addSubview(valueLabel)
    }
    
    private func setupConstraints() {
        setupBackgroundContainerViewConstraints()
        setupTypeLabelConstraints()
        setupDetailLabelConstraints()
        setupDateLabelConstraints()
        setupValueLabelConstraints()
    }
    
    private func setupBackgroundContainerViewConstraints() {
        backgroundContainerView.translatesAutoresizingMaskIntoConstraints = false
        backgroundContainerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        backgroundContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        backgroundContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        backgroundContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
    }
    
    private func setupTypeLabelConstraints() {
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.topAnchor.constraint(equalTo: backgroundContainerView.topAnchor, constant: 18).isActive = true
        typeLabel.leadingAnchor.constraint(equalTo: backgroundContainerView.leadingAnchor, constant: 20).isActive = true
    }
    
    private func setupDetailLabelConstraints() {
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 18).isActive = true
        detailLabel.leadingAnchor.constraint(equalTo: backgroundContainerView.leadingAnchor, constant: 20).isActive = true
        detailLabel.trailingAnchor.constraint(equalTo: backgroundContainerView.trailingAnchor, constant: -20).isActive = true
    }
    
    private func setupDateLabelConstraints() {
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.topAnchor.constraint(equalTo: backgroundContainerView.topAnchor, constant: 18).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: backgroundContainerView.trailingAnchor, constant: -20).isActive = true
    }
    
    private func setupValueLabelConstraints() {
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 13).isActive = true
        valueLabel.trailingAnchor.constraint(equalTo: backgroundContainerView.trailingAnchor, constant: -20).isActive = true
        valueLabel.bottomAnchor.constraint(equalTo: backgroundContainerView.bottomAnchor, constant: -18).isActive = true
    }
}
