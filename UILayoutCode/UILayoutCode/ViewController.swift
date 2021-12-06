//
//  ViewController.swift
//  UILayoutCode
//
//  Created by Felix on 22.11.2021.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
  
  private let onBoarding = OnBoardingView()
  
  var onboarding: OnBoardingView { return self.view as! OnBoardingView }
  
  var completionHandler: (() -> Void)?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
   // view.addSubview(onBoarding)
    loadView()
  }
  
  override func loadView() {
    self.view = OnBoardingView(frame: UIScreen.main.bounds)
  }

  private func reloadOnBoarding() {
    onboarding.configure(
      title: "Новое",
      description: "Описание",
      image: UIImage(named: "onBoardingOne")!,
      buttonTitle: "Понятно")
  }
  
}
