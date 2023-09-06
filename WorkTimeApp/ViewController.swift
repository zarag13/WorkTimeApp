//
//  ViewController.swift
//  WorkTimeApp
//
//  Created by Kirill on 06.09.2023.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {
    
    private let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        view.addSubview(button)
        
        button.backgroundColor = .red
        button.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(100)
        }
    }
}

