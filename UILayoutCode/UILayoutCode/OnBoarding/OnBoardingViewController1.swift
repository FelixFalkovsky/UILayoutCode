//
//  OnBoardingCollectionController.swift
//  UILayoutCode
//
//  Created by Felix on 25.12.2021.
//

import Foundation
import UIKit

class OnBoardingViewController1: UIViewController {
  
  var onBoardingView = OnBoardingView()
 
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    onBoardingView.configure(
      title: "1",
      description: "1",
      image: UIImage(named: "onBoardingOne")!,
      buttonTitle: "1", tapButton: {
        
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
