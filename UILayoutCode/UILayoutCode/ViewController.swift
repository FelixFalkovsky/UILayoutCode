//
//  ViewController.swift
//  UILayoutCode
//
//  Created by Felix on 22.11.2021.
//

import UIKit

class ViewController: UIViewController {
  
  private let onBoarding = OnBoardingView()
  
  var onboarding: OnBoardingView { return self.view as! OnBoardingView }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    self.view.addSubview(onBoarding)
    
  }
  
  override func loadView() {
    self.view = OnBoardingView(frame: UIScreen.main.bounds)
  }

}
