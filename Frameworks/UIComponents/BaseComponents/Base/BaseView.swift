//
//  BaseView.swift
//  UIComponents
//
//  Created by Kirill on 06.09.2023.
//

import UIKit

open class BaseView: UIView {
    
    
    public override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension BaseView {
    @objc func setup() {
        
    }
}
