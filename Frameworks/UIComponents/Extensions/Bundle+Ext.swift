//
//  Bundle+Ext.swift
//  UIComponents
//
//  Created by Kirill on 06.09.2023.
//

import Foundation

class BundleHandler{}

extension Bundle {
    static let uiComponents = Bundle(for: BundleHandler.self)
}
