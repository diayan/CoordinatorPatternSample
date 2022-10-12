//
//  CarDetailsFirstLandingPageVC.swift
//  CoordinatorSample
//
//  Created by diayan siat on 10/10/2022.
//

import UIKit

public protocol CarDetailsFirstLandingPageVCDelegate: AnyObject {
    func carDetailFirstPageVCDidTapNext(_ controller: CarDetailsFirstLandingPageVCDelegate)
}

class CarDetailsFirstLandingPageVC: UIViewController {
    
    public var delegate: CarDetailsFirstLandingPageVCDelegate?
    private var buttonColor: UIColor!
    private var text: String!
    
    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.backgroundColor = .systemGreen
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            nextButton.heightAnchor.constraint(equalToConstant: 40),
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:16),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension CarDetailsFirstLandingPageVC {
    public class func instantiate(delegate: CarDetailsFirstLandingPageVCDelegate,
                                  title: String,
                                  text: String) -> CarDetailsFirstLandingPageVC {
        let vc = CarDetailsFirstLandingPageVC()
        vc.delegate = delegate
        vc.title = title
        vc.text = text
        return vc
    }
}
