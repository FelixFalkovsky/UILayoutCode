//
//  OnBoardingViewController.swift
//  UILayoutCode
//
//  Created by Felix on 04.12.2021.
//

import Foundation
import UIKit

class OnBoardingViewController: UIViewController {
  
  let onBoarding = OnBoardingView()
  
  let stackView = UIStackView()
  let titleLabel = UILabel()
  let descriptionText = UILabel()
  let imageView = UIImageView()
  let button: UIButton = UIButton()
  
  init(title: String, description: String, image: String, button: String) {
    super.init(nibName: nil, bundle: nil)
    imageView.image = UIImage(named: image)
    titleLabel.text = title
    descriptionText.text = description
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .brown
    //createBoarding()
    style()
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func createBoarding() {
    onBoarding.configure(title: "1", description: "1", image: UIImage(named: "onBoardingOne")!, buttonTitle: "1")
    view.addSubview(onBoarding)
  }
  
}

extension OnBoardingViewController {
    
    func style() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 20
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        
      descriptionText.translatesAutoresizingMaskIntoConstraints = false
      descriptionText.font = UIFont.preferredFont(forTextStyle: .body)
      descriptionText.textAlignment = .center
        
      descriptionText.numberOfLines = 0
    }
        
    func layout() {
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionText)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            imageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            
            descriptionText.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: descriptionText.trailingAnchor, multiplier: 2),
        ])
    }
}
