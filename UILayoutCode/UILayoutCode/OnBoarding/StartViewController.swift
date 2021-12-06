//
//  StartViewController.swift
//  UILayoutCode
//
//  Created by Felix on 04.12.2021.
//

import Foundation
import UIKit

class StartViewController: UIPageViewController{
  
  var pages = [UIViewController]()
  let pageControl = UIPageControl()
  let initialPage = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
   
    setup()
    layout()
  }
  
  func setup() {
    delegate = self
    dataSource = self

    pageControl.addTarget(self, action: #selector(tappedPageControll), for: .valueChanged)
    
    let page1 = OnBoardingViewController(title: "Привет", description: "GHbdtn", image: "", button: "Привет")
    
    pages.append(page1)
    
    setViewControllers([pages[initialPage]], direction: .forward, animated: true, completion: nil)
  }
  
  @objc func tappedPageControll(_ sender: UIPageControl) {
    setViewControllers([pages[sender.currentPage]], direction: .forward, animated: true, completion: nil)
  }
  
  func stylePageControl() {
    pageControl.translatesAutoresizingMaskIntoConstraints = false
    pageControl.currentPageIndicatorTintColor = .black
    pageControl.pageIndicatorTintColor = .systemGray2
    pageControl.numberOfPages = pages.count
    pageControl.currentPage = initialPage
  }
  
  func layout() {
    
    NSLayoutConstraint.activate([
//      pag.topAnchor.constraint(equalTo: view.topAnchor),
//      pag.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//      pag.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//      pag.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//      pageControl.widthAnchor.constraint(equalTo: view.widthAnchor),
//      pageControl.heightAnchor.constraint(equalToConstant: 20),
//      view.bottomAnchor.constraint(equalToSystemSpacingBelow: pageControl.bottomAnchor, multiplier: 1),
    ])
  }
  
}

extension StartViewController: UIPageViewControllerDataSource {
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
    if currentIndex == 0 {
      return pages.last
    } else {
      return pages[currentIndex - 1]
    }
    
  }
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
    if currentIndex < pages.count - 1 {
      return pages[currentIndex + 1]
    } else {
      return pages.first
    }
  }
}

//MARK: Delegate

extension StartViewController: UIPageViewControllerDelegate {
  func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
    guard let viewControllers = pageViewController.viewControllers else { return }
    guard let currentIndex = pages.firstIndex(of: viewControllers[0]) else { return }
    pageControl.currentPage = currentIndex
  }
}
