//
//  BaseViewController.swift
//  UIComponents
//
//  Created by Kirill on 06.09.2023.
//

import Foundation

open class BaseViewController: UIViewController {
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension BaseViewController {
    @objc open func setup() {
        
    }
}
