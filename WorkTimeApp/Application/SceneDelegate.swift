//
//  SceneDelegate.swift
//  WorkTimeApp
//
//  Created by Kirill on 06.09.2023.
//

import UIKit
import AuthSDK

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = AuthViewController()
        window?.makeKeyAndVisible()
        
    }
}

