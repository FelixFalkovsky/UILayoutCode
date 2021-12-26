//
//  OnBoardingViewController4.swift
//  UILayoutCode
//
//  Created by Felix on 26.12.2021.
//

import UIKit

class OnBoardingViewController4: UIViewController {

  var onBoardingView = OnBoardingView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    onBoardingView.configure(
      title: "4",
      description: "4",
      image: UIImage(named: "onBoardingTwo")!,
      buttonTitle: "4", tapButton: {
        
      })
    
    view.addSubviewsForAutoLayout([
      onBoardingView
    ])
    
    NSLayoutConstraint.activate([
      onBoardingView.topAnchor.constraint(equalTo: view.topAnchor),
      onBoardingView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      onBoardingView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      onBoardingView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    ])
  }
}
