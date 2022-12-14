//
//  NavigationRouter.swift
//  CoordinatorSample
//
//  Created by diayan siat on 09/10/2022.
//

import Foundation
import UIKit

public class NavigationRouter: NSObject {
    private let navigationController: UINavigationController
    private let routerRouteController: UIViewController?
    private var onDismissForViewController: [UIViewController: (() -> Void)] = [:]
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.routerRouteController = navigationController.viewControllers.first
        super.init()
        navigationController.delegate = self
    }
}

extension NavigationRouter: Router {
    public func present(_ viewController: UIViewController, animated: Bool, onDismissed: (() -> Void)?) {
        onDismissForViewController[viewController] = onDismissed
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    public func dismiss(animated: Bool) {
        guard let routerRouteController = routerRouteController else {
            navigationController.popToRootViewController(animated: animated)
            return
        }
        
        performOnDismissed(for: routerRouteController)
        navigationController.popToViewController(routerRouteController, animated: animated)
    }
    
    func performOnDismissed(for viewController: UIViewController) {
        guard let onDismiss = onDismissForViewController[viewController] else { return }
        onDismiss()
        onDismissForViewController[viewController] = nil
    }
}

extension NavigationRouter: UINavigationControllerDelegate {
     public func navigationController( _ navigationController: UINavigationController, didShow viewController: UIViewController,
        animated: Bool) {

        guard let dismissedViewController = navigationController.transitionCoordinator?.viewController(forKey: .from),
          !navigationController.viewControllers.contains(dismissedViewController) else {
          return
        }
         
        performOnDismissed(for: dismissedViewController)
      }
}
