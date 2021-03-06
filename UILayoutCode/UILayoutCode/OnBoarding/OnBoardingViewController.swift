//
//  OnBoardingViewController.swift
//  UILayoutCode
//
//  Created by Felix on 04.12.2021.
//

import Foundation
import UIKit

class OnBoardingViewController: UIViewController, UIScrollViewDelegate {
  
  let sceneWidth = UIScreen.main.bounds.width
  let sceneHeight = UIScreen.main.bounds.height
  let scrollView: UIScrollView = UIScrollView()
  var slides: [UIViewController] = [
    OnBoardingViewController1(),
    OnBoardingViewController2(),
    OnBoardingViewController3(),
    OnBoardingViewController4()
  ]
  var pageControl = UIPageControl()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configurePageControl()
    settingsScene()
    
    scrollView.delegate = self
    
    self.view.addSubview(scrollView)
    
    for index in 0..<4 {
      slides[index].view.frame = CGRect(x: view.frame.width * CGFloat(index), y: 0, width: sceneWidth, height: sceneHeight)
      scrollView.addSubview(slides[index].view)
    }
    
    self.scrollView.isPagingEnabled = true
    self.scrollView.contentSize = CGSize(width: self.scrollView.frame.size.width * 4, height: self.scrollView.frame.size.height)
    pageControl.addTarget(self, action: #selector(self.changePage), for: .touchDragInside)
  }
  
  func configurePageControl() {
    self.pageControl.numberOfPages = slides.count
    self.pageControl.currentPage = 0
    self.pageControl.tintColor = UIColor.gray
    self.pageControl.pageIndicatorTintColor = UIColor.black
    self.pageControl.currentPageIndicatorTintColor = UIColor.green
    self.view.addSubview(pageControl)
  }
  
  func settingsScene() {
    scrollView.frame = CGRect(x: 0, y: 0, width: sceneWidth, height: sceneHeight)
    pageControl.frame = CGRect(x: 0, y: sceneWidth, width: sceneWidth, height: sceneHeight)
    
    self.scrollView.isPagingEnabled = true
    self.scrollView.contentSize = CGSize(width: self.scrollView.frame.size.width * 4, height: self.scrollView.frame.size.height)
  }
  
  @objc
  func changePage(sender: AnyObject) -> () {
    let x = CGFloat(pageControl.currentPage) * scrollView.frame.size.width
    scrollView.setContentOffset(CGPoint(x: x, y: 0), animated: true)
  }
  
  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
    pageControl.currentPage = Int(pageNumber)
  }
  
}

