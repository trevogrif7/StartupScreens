//
//  createAccountView.swift
//  StartupScreens
//
//  Created by Trevor Griffin on 12/26/16.
//  Copyright © 2016 TREVOR E GRIFFIN. All rights reserved.
//

import UIKit

class createAccountView: UIView {

    var backgroundView = UIView()
    var topView = UIView()
    var usernameTextField = UITextField()
    var firstNameTextField = UITextField()
    var lastNameTextField = UITextField()
    var emailTextField = UITextField()
    var passwordTextField = UITextField()
    var reEnterPasswordTextField = UITextField()
    var profileImageView = UIImageView()
    var cancelButton = UIButton()
    var saveButton = UIButton()
    var createAccountLabel = UILabel()
    
    let defaultBorderColor = UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1.0).cgColor

    // First default UIView class initializer
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        initialize()
    }
    
    // Second default UIView class initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }

    func initialize () {
        
        // Format text fields
        usernameTextField.layer.borderWidth = 1.0
        emailTextField.layer.borderWidth = 1.0
        firstNameTextField.layer.borderWidth = 1.0
        lastNameTextField.layer.borderWidth = 1.0
        passwordTextField.layer.borderWidth = 1.0
        reEnterPasswordTextField.layer.borderWidth = 1.0
        
        usernameTextField.layer.borderColor = defaultBorderColor
        emailTextField.layer.borderColor = defaultBorderColor
        firstNameTextField.layer.borderColor = defaultBorderColor
        lastNameTextField.layer.borderColor = defaultBorderColor
        passwordTextField.layer.borderColor = defaultBorderColor
        reEnterPasswordTextField.layer.borderColor = defaultBorderColor
        
        // Format label and buttons
        createAccountLabel.font = UIFont(name: "GillSans", size: 18)
        cancelButton.titleLabel?.font = UIFont(name: "GillSans", size: 14)
        saveButton.titleLabel?.font = UIFont(name: "GillSans", size: 14)
        
        
        // Make profile image round
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.cornerRadius = profileImageView.frame.height/2
        
        // Add shadow to top view
        topView.layer.shadowColor = UIColor.black.cgColor
        topView.layer.masksToBounds = false
        topView.layer.shadowOpacity = 0.8
        topView.layer.shadowRadius = 10
        topView.layer.shadowOffset = CGSize(width: -5.0, height: 3.0)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
