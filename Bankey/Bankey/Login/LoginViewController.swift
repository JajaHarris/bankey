import UIKit

class LoginViewController: UIViewController {
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    let bankNameLabel = UILabel()
    let welcomeLabel = UILabel()
    
    var username: String? {
        return loginView.usernameTextField.text
    }
    
    var password: String? {
        return loginView.passwordTextField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }

    @objc func signInButtonWasTapped() {
        errorMessageLabel.isHidden = true
        login()
    }
    
    private func login() {
        guard let username = username, let password = password else {
            assertionFailure("Username and password are nil")
            return
        }

        if username.isEmpty || password.isEmpty {
            showErrorLabel(withMessage: "Username / password cannot be blank")
            return
        }
        
        if username.lowercased() == "kevin" && password == "welcome" {
            signInButton.configuration?.showsActivityIndicator = true
        } else {
            showErrorLabel(withMessage: "Incorrect username / password")
        }
    }
    
    private func showErrorLabel(withMessage message: String) {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
}

extension LoginViewController {
    private func style() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInButtonWasTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0 //value of zero makes it multi-line
        errorMessageLabel.isHidden = true
        
        bankNameLabel.text = "Bankey"
        welcomeLabel.text = "Your premium source for all things banking!"
    }

    private func layout() {
        view.addSubview(bankNameLabel)
        view.addSubview(welcomeLabel)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)

        NSLayoutConstraint.activate([
            welcomeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            welcomeLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: welcomeLabel.trailingAnchor, multiplier: 1)
        ])

        NSLayoutConstraint.activate([
            bankNameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            bankNameLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: bankNameLabel.trailingAnchor, multiplier: 1)
        ])
        
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
        ])
        
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: signInButton.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: signInButton.trailingAnchor)
        ])
    }
}
