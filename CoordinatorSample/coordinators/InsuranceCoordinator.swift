//
//  InsuranceCoordinator.swift
//  CoordinatorSample
//
//  Created by diayan siat on 09/10/2022.
//

import Foundation

public class InsuranceCoordinator: Coordinator {
    public var children: [Coordinator] = []
    public let router: Router

    private lazy var carDetailsVC = [
        CarDetailsFormVC.instantiate(
            delegate: self,
            title: "Car Make",
            text: "Next"
        ),
        
        CarDetailsFormVC.instantiate(
            delegate: self,
            title: "Car Make",
            text: "Next"
        )
    ]
    
//    private lazy var carDetailsOverViewController = CarDetailsFirstLandingPageVC.instantiate(
//        delegate: self, title: "First Landing Page", text: "This is the first landing page")
//
    
    public init(router: Router) {
        self.router = router
    }
    
    public func present(animated: Bool, onDismissed: (() -> Void)?) {
        let viewController = carDetailsVC.first!
        router.present(viewController, animated: true, onDismissed: onDismissed)
    }
}

extension InsuranceCoordinator: CarDetailsFormVCDelegate {
    
    public func carDetailsViewControllerDidPressNext(_ controller: CarDetailsFormVC) {
        if let viewController = carDetailsVC(after: controller) {
          router.present(viewController, animated: true)
        } else {
         //router.present(carDetailsOverViewController, animated: true)
        }
    }
    
    private func carDetailsVC(after controller: CarDetailsFormVC) -> CarDetailsFormVC? {
        guard let index = carDetailsVC
                .firstIndex(where: {$0 === controller}),
              index < carDetailsVC.count - 1 else {return nil}
        return carDetailsVC[index + 1]
    }
}

//extension InsuranceCoordinator: CarDetailsFirstLandingPageVCDelegate {
//    public func carDetailFirstPageVCDidTapNext(_ controller: CarDetailsFirstLandingPageVCDelegate) {
//
//    }
    
//}
