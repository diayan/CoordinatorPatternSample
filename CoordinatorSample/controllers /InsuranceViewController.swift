//
//  InsuranceViewController.swift
//  CoordinatorSample
//
//  Created by diayan siat on 10/10/2022.
//

import UIKit

class InsuranceViewController: UIViewController {
    
    public var onButtonPressed: (() -> Void)?

    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Start Insurance", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        setupButton()
    }
    
    private func setupButton() {
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.heightAnchor.constraint(greaterThanOrEqualToConstant: 100).isActive = true
        button.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        button.setTitle("How to Code", for: .normal)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
    }
    
    @objc private func buttonPressed(_ sender: AnyObject) {
      onButtonPressed?()
    }
}

extension InsuranceViewController {
    public class func instantiate() -> InsuranceViewController {
        let viewController = InsuranceViewController()
        viewController.title = "Insurance"
        return viewController
    }
}
