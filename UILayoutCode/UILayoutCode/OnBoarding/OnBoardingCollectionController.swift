//
//  OnBoardingCollectionController.swift
//  UILayoutCode
//
//  Created by Felix on 25.12.2021.
//

import Foundation
import UIKit

class OnBoardingCollectionController: UIViewController, UIScrollViewDelegate {
  
  private let scrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.isMultipleTouchEnabled = true
    scrollView.isUserInteractionEnabled = true
    scrollView.contentMode = .scaleAspectFill
    scrollView.isScrollEnabled = true
    scrollView.showsHorizontalScrollIndicator = false
    scrollView.showsVerticalScrollIndicator = false
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    scrollView.backgroundColor = .systemBackground
    return scrollView
  }()
  
  var onBoardingView = OnBoardingView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    scrollView.delegate = self
    
    onBoardingView.configure(
      title: "asd",
      description: "asd",
      image: UIImage(named: "onBoardingOne")!,
      buttonTitle: "asd")
    
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
