//
//  SceneDelegate.swift
//  Collections
//
//  Created by Rustam-Deniz on 7/30/20.
//  Copyright © 2020 Rustam-Deniz. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let scene = (scene as? UIWindowScene) else { return }
		let window = UIWindow(windowScene: scene)
		let tabBar = UITabBarController()
		let searchNav = UINavigationController()
		let collectionNav = UINavigationController()
		searchNav.viewControllers = [SearchViewController()]
		collectionNav.viewControllers = [CollectionsViewController()]
		let searchBar = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), selectedImage: nil)
		let collectionBar = UITabBarItem(title: "Collections", image: UIImage(systemName: "book"), selectedImage: nil)
		collectionNav.tabBarItem = collectionBar
		searchNav.tabBarItem = searchBar
		tabBar.viewControllers = [searchNav, collectionNav]
		window.rootViewController = tabBar
		self.window = window
		window.makeKeyAndVisible()
	}

	func sceneDidDisconnect(_ scene: UIScene) {
	}

	func sceneDidBecomeActive(_ scene: UIScene) {
	}

	func sceneWillResignActive(_ scene: UIScene) {
	}

	func sceneWillEnterForeground(_ scene: UIScene) {
	}

	func sceneDidEnterBackground(_ scene: UIScene) {
		(UIApplication.shared.delegate as? AppDelegate)?.saveContext()
	}

}
