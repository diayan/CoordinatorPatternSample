//
//  CarDetailsFormVC.swift
//  CoordinatorSample
//
//  Created by diayan siat on 10/10/2022.
//

import UIKit

public protocol CarDetailsFormVCDelegate: AnyObject {
  func carDetailsViewControllerDidPressNext(_ controller: CarDetailsFormVC)
}

public class CarDetailsFormVC: UIViewController {
    public var delegate: CarDetailsFormVCDelegate?

    private var buttonColor: UIColor!
    private var text: String!
    
    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.backgroundColor = .systemPurple
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
        view.backgroundColor = .systemYellow
    }
    
    private func setupButton() {
        view.addSubview(nextButton)
        nextButton.setTitle(text, for: .normal)
        nextButton.addTarget(self, action: #selector(nextButtonPressed(_:)), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            nextButton.heightAnchor.constraint(equalToConstant: 40),
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:16),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc private func nextButtonPressed(_ sender: AnyObject) {
      delegate?.carDetailsViewControllerDidPressNext(self)
    }
}

extension CarDetailsFormVC {
    public class func instantiate(delegate: CarDetailsFormVCDelegate,
                                  title: String,
                                  text: String) -> CarDetailsFormVC {
        let vc = CarDetailsFormVC()
        vc.delegate = delegate
        vc.title = title
        vc.text = text
        return vc
    }
}
