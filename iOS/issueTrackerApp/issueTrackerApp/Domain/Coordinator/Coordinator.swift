//
//  Coordinator.swift
//  issueTrackerApp
//
//  Created by zombietux on 2021/06/08.
//

import UIKit

// MARK: Protocols
protocol Coordinator: AnyObject {
    func configure(viewController: UIViewController)
}

protocol Coordinated: class {
    var coordinator: Coordinator? { get set }
}

protocol MainCoordinated: AnyObject {
    var mainCoordinator: MainFlowCoordinator? { get set }
}

protocol LoginCoordinated: AnyObject {
    var loginCoordinator: LoginFlowCoordinator? { get set }
}

protocol Networked: class {
    var networkController: NetworkController? { get set }
}

protocol Stateful: AnyObject {
    var stateController: StateController? { get set }
}

class MainFlowCoordinator: NSObject {
    let mainTabBarController: MainTabBarController
    let keyChainController = KeychainController()
    let loginFlowCoordinator = LoginFlowCoordinator()
    let stateController = StateController()
    
    init(mainViewController: MainTabBarController) {
        self.mainTabBarController = mainViewController
        super.init()
        loginFlowCoordinator.parent = self
        configure(viewController: mainViewController)
    }
    
    func logOut() {
        loginFlowCoordinator.mainViewControllerRequiresAuthentication(mainTabBarController, isAppLaunch: false)
    }
}

extension MainFlowCoordinator: Coordinator {
    func configure(viewController: UIViewController) {
        (viewController as? MainCoordinated)?.mainCoordinator = self
        (viewController as? Networked)?.networkController = NetworkController(keychainController: keyChainController)
        (viewController as? LoginCoordinated)?.loginCoordinator = loginFlowCoordinator
        (viewController as? Stateful)?.stateController = stateController
        if let tabBarController = viewController as? UITabBarController {
            tabBarController.viewControllers?.forEach(configure(viewController:))
        }
        if let navigationController = viewController as? UINavigationController,
            let rootViewController = navigationController.viewControllers.first {
            configure(viewController: rootViewController)
        }
    }
}
