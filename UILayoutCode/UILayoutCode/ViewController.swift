//
//  ViewController.swift
//  UILayoutCode
//
//  Created by Felix on 22.11.2021.
//

import UIKit

class ViewController: UIViewController {
  
  private let onBoarding = OnBoardingView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    view.addSubview(onBoarding)
    
  }

}
