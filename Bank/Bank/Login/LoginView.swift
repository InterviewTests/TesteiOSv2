import UIKit

class LoginView: UIView {
    
    private let scrollView = UIScrollView()
    private let view = UIView()
    private let stackViewTextFields = UIStackView()
    private let imgViewLogo = UIImageView()
    private let txtFieldLogin = UITextField()
    private let txtFieldPass = UITextField()
    private let btnLogin = UIButton()
    
    var loginDelegate: LoginDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupHierarchy()
        setupLayout()
    }
    
    fileprivate func setupViews() {
        
        configStackView()
        configBackground()
        configImageViewLogo()
        configTxtFieldLogin()
        configTxtFieldSenha()
        configBtnLogin()
    }
    
    fileprivate func setupHierarchy() {
        
        addSubview(scrollView)
        scrollView.addSubview(view)
        view.addSubview(imgViewLogo)
        stackViewTextFields.addArrangedSubview(txtFieldLogin)
        stackViewTextFields.addArrangedSubview(txtFieldPass)
        view.addSubview(stackViewTextFields)
        view.addSubview(btnLogin)
    }
    
    fileprivate func setupLayout() {
        
        scrollView.pin(to: self.safeAreaLayoutGuide)
        
        view.pinToSuperview()
        view.centerToSuperview()

        imgViewLogo.pinToSuperview(sides: [.top], constant: 64)
        imgViewLogo.centerHorizontalToSuperview()
        
        stackViewTextFields.pinToSuperview(sides: [.left, .right], constant: 16)
        stackViewTextFields.centerToSuperview()
        
        btnLogin.pinToSuperview(sides: [.bottom], constant: 24)
        btnLogin.centerHorizontalToSuperview()
    }
    
    fileprivate func configBackground() {
        
        backgroundColor = .white
    }
    
    fileprivate func configImageViewLogo() {
        
        imgViewLogo.image = UIImage(named: "Logo")
    }
    
    fileprivate func configStackView() {
        
        stackViewTextFields.alignment = .fill
        stackViewTextFields.axis = .vertical
        stackViewTextFields.spacing = 18
        stackViewTextFields.distribution = .fillEqually
    }
    
    fileprivate func configTxtFieldLogin() {
        
        setConfigTextField(textField: txtFieldLogin, placeHolder: NSLocalizedString("login_user", comment: ""), isSecureTextEntry: false, isBecomeFirstResponder: true)
    }
    
    fileprivate func configTxtFieldSenha() {
        
        setConfigTextField(textField: txtFieldPass, placeHolder: NSLocalizedString("login_password", comment: ""), isSecureTextEntry: true, isBecomeFirstResponder: false)
    }
    
    fileprivate func setConfigTextField(textField: UITextField, placeHolder: String, isSecureTextEntry: Bool, isBecomeFirstResponder: Bool, opacity: CGFloat = 0.1, borderColor: UIColor = UIColor.blue) {

        textField.placeholder = placeHolder
        textField.isSecureTextEntry = isSecureTextEntry
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1
        textField.layer.borderColor = borderColor.withAlphaComponent(opacity).cgColor
        textField.setLeftPaddingPoints(10)
        textField.height(equalToConstant: 60)
    }
    
    fileprivate func configBtnLogin() {
        
        btnLogin.setTitle(NSLocalizedString("login_button", comment: ""), for: .normal)
        btnLogin.backgroundColor = UIColor(named: "loginButton")
        btnLogin.height(equalToConstant: 50)
        btnLogin.width(equalToConstant: 190)
        btnLogin.layer.cornerRadius = 4
        btnLogin.addTarget(self, action: #selector(clickButtonLogin), for: .touchUpInside)
    }
    
    @objc fileprivate func clickButtonLogin() {
        loginDelegate?.clickButtonLogin(user: txtFieldLogin.text, password: txtFieldPass.text)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
