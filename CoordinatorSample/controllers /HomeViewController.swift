//
//  ViewController.swift
//  CoordinatorSample
//
//  Created by diayan siat on 09/10/2022.
//

import UIKit

public class HomeViewController: UIViewController {

    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("Next", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button 
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        setupButton()
    }

    private func setupButton() {
        view.addSubview(nextButton)
        nextButton.addTarget(self, action: #selector(startInsurance(_:)), for: .touchUpInside)
        NSLayoutConstraint.activate([
            nextButton.heightAnchor.constraint(equalToConstant: 80),
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:16),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc private func startInsurance(_ sender: AnyObject) {
        let insuranceViewController = InsuranceViewController.instantiate()
        let router = NavigationRouter(navigationController: self.navigationController!)
        let coordinator = InsuranceCoordinator(router: router)
        insuranceViewController.onButtonPressed = { [weak coordinator] in
            coordinator?.present(animated: true, onDismissed: nil)
            print("coordinator initiated")
        }
        self.navigationController?.pushViewController(insuranceViewController, animated: true)
                
    }
}

