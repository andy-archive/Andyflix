//
//  MovieSignupViewController.swift
//  Andyflix
//
//  Created by Taekwon Lee on 2023/09/18.
//

import UIKit

final class MovieSignupViewController: BaseViewController {
    
    private let viewModel = MovieSignupViewModel()
    
    private let titleLabel = {
        let view = UILabel()
        view.font = .boldSystemFont(ofSize: 30)
        view.textColor = .red
        view.numberOfLines = 1
        return view
    }()
    
    //MARK: signupStackView
    
    private let signupStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fill
        view.spacing = 16
        return view
    }()
    
    private let idTextField = {
        let view = MovieSignupTextField()
        view.keyboardType = .emailAddress
        view.attributedPlaceholder = NSAttributedString(string: "이메일 주소 또는 전화번호", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.6)])
        return view
    }()
    
    private let passwordTextField = {
        let view = MovieSignupTextField()
        view.attributedPlaceholder = NSAttributedString(string: "비밀번호", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.6)])
        view.isSecureTextEntry = true
        return view
    }()
    
    private let nicknameTextField = {
        let view = MovieSignupTextField()
        view.attributedPlaceholder = NSAttributedString(string: "닉네임", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.6)])
        return view
    }()
    
    private let locationTextField = {
        let view = MovieSignupTextField()
        view.attributedPlaceholder = NSAttributedString(string: "위치", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.6)])
        return view
    }()
    
    private let referralCodeTextField = {
        let view = MovieSignupTextField()
        view.keyboardType = .numberPad
        view.attributedPlaceholder = NSAttributedString(string: "추천 코드 입력", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.6)])
        return view
    }()
    
    private let signupButton = {
        let view = UIButton()
        view.setTitle("회원가입", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.setTitleColor(.white, for: .highlighted)
        view.titleLabel?.font = .boldSystemFont(ofSize: 17)
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 5
        return view
    }()
    
    //MARK: extraInfoStackView
    
    private let extraInfoStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fill
        return view
    }()
    
    private let extraInfoLabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 15)
        view.text = "추가 정보 입력"
        return view
    }()
    
    private let extraInfoSwitch = {
        let view = UISwitch()
        view.onTintColor = .systemRed
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindViewModel()
        hideKeyboardWhenTappedAround()
    }
    
    private func bindViewModel() {
        viewModel.id.bind { [weak self] text in
            self?.idTextField.text = text
        }
        
        viewModel.password.bind { [weak self] text in
            self?.passwordTextField.text = text
        }
        
        viewModel.referralCode.bind { [weak self] text in
            self?.referralCodeTextField.text = text
        }
        
        viewModel.isValid.bind { [weak self] bool in
            self?.signupButton.isEnabled = bool
            self?.signupButton.backgroundColor = bool ? .systemRed : .white
        }
    }
    
    @objc
    private func idTextFieldChanged() {
        guard let text = idTextField.text else { return }
        viewModel.id.value = text
        viewModel.checkValidation()
    }
    
    @objc
    private func passwordTextFieldChanged() {
        guard let text = passwordTextField.text else { return }
        viewModel.password.value = text
        viewModel.checkValidation()
    }
    
    @objc
    private func referralCodeTextFieldChanged() {
        guard let text = referralCodeTextField.text else { return }
        viewModel.referralCode.value = text
        viewModel.checkValidation()
    }
    
    override func configureView() {
        super.configureView()
        
        titleLabel.text = "ANDYFLIX"
        
        view.addSubview(titleLabel)
        view.addSubview(signupStackView)
        view.addSubview(extraInfoStackView)
        
        [idTextField, passwordTextField, nicknameTextField, locationTextField, referralCodeTextField, signupButton].forEach { view in
            signupStackView.addArrangedSubview(view)
        }
        
        [extraInfoLabel, extraInfoSwitch].forEach { view in
            extraInfoStackView.addArrangedSubview(view)
        }
        
        idTextField.addTarget(self, action: #selector(idTextFieldChanged), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(passwordTextFieldChanged), for: .editingChanged)
        referralCodeTextField.addTarget(self, action: #selector(referralCodeTextFieldChanged), for: .editingChanged)
    }
    
    override func setConstraints() {
        super.setConstraints()
        
        let spacing: CGFloat = 28
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        signupStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            signupStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: spacing),
            signupStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -spacing),
            signupStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        extraInfoStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            extraInfoStackView.topAnchor.constraint(equalTo: signupStackView.bottomAnchor, constant: 20),
            extraInfoStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: spacing),
            extraInfoStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -spacing),
        ])
        
        [idTextField, passwordTextField, nicknameTextField, locationTextField, referralCodeTextField].forEach { textfield in
            textfield.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                textfield.heightAnchor.constraint(equalToConstant: 32)
            ])
        }
        
        signupButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            signupButton.heightAnchor.constraint(equalToConstant: 36)
        ])
        
    }
    
}
