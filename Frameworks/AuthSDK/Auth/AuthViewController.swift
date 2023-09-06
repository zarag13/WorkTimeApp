//
//  AuthViewController.swift
//  Pods
//
//  Created by Kirill on 06.09.2023.
//

import UIKit
import UIComponents
import SnapKit

fileprivate extension Constants {
    static let horizontalOffset: CGFloat = 45
    static let buttonDividerOffset: CGFloat = 5
    static let interItemOffset: CGFloat = 58
    static let fieldHeight: CGFloat = 28
}

public final class AuthViewController: BaseViewController {
    
    private let contentView = UIView()
    
    private let titleSwitchView = TWSwitchView()
    private let loginTextField = WTAuthTextField()
    private let passwordTextField = WTAuthTextField()
    
    private let loginButton = UIButton()
    
    override public func setup() {
        super.setup()
        setupContentView()
        setupTitleSwitchView()
        setupLoginTextField()
        setupPasswordTextField()
        setupLoginButton()
        view.backgroundColor = WTColor.background_g1()
    }
}

private extension AuthViewController {
    
    func setupContentView() {
        view.addSubview(contentView)
        contentView.snp.makeConstraints {
            //horizontalEdges - растянутая по ширине и высоте
            $0.centerY.horizontalEdges.equalToSuperview()
        }
    }
    
    func setupTitleSwitchView() {
        contentView.addSubview(titleSwitchView)
        titleSwitchView.titles = ("Login", "Sign Up")
        titleSwitchView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(Constants.horizontalOffset)
        }
    }
    
    
    
    //loginTextField
    func setupLoginTextField() {
        contentView.addSubview(loginTextField)
        loginTextField.placeholder = "Username"
        
        loginTextField.snp.makeConstraints {
            $0.top.equalTo(titleSwitchView.snp.bottom).offset(Constants.interItemOffset)
            $0.leading.equalToSuperview().inset(Constants.horizontalOffset)
            $0.height.equalTo(Constants.fieldHeight)
        }
    }
    
    
    //passwordTextField
    func setupPasswordTextField() {
        contentView.addSubview(passwordTextField)
        passwordTextField.placeholder = "Password"
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(loginTextField.snp.bottom).offset(Constants.interItemOffset)
            $0.leading.equalToSuperview().inset(Constants.horizontalOffset)
            $0.height.equalTo(Constants.fieldHeight)
        }
    }
    
    
    //loginButton
    func setupLoginButton() {
        contentView.addSubview(loginButton)
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.black, for: .normal)
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(Constants.interItemOffset)
            $0.trailing.equalToSuperview().inset(Constants.horizontalOffset)
            $0.bottom.equalToSuperview()
        }
    }
    
}
