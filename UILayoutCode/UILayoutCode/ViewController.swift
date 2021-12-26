//
//  ViewController.swift
//  UILayoutCode
//
//  Created by Felix on 22.11.2021.
//

import UIKit

class ViewController: UIPageViewController {
  
  //  private let scrollView: UIScrollView = {
  //    let scrollView = UIScrollView()
  //    scrollView.isMultipleTouchEnabled = true
  //    scrollView.isUserInteractionEnabled = true
  //    scrollView.contentMode = .scaleAspectFill
  //    scrollView.isScrollEnabled = true
  //    scrollView.showsHorizontalScrollIndicator = false
  //    scrollView.showsVerticalScrollIndicator = false
  //    scrollView.translatesAutoresizingMaskIntoConstraints = false
  //    scrollView.backgroundColor = .systemBackground
  //    scrollView.layer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 300)
  //    return scrollView
  //  }()
  var pages = [UIViewController]()
  let pageControl = UIPageControl()
  let initialPage = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // scrollView.delegate = self
    
    dataSource = self
    delegate = self
    
    pageControl.addTarget(self, action: #selector(pageControlTapped(_:)), for: .valueChanged)
    
    let page1 = OnBoardingViewController1()
    let page2 = OnBoardingViewController1()
    let page3 = OnBoardingViewController1()
    
    pages.append(page1)
    pages.append(page2)
    pages.append(page3)
    
    setViewControllers([pages[initialPage]], direction: .forward, animated: true, completion: nil)
    
    style()
    layout()
    view.addSubviewsForAutoLayout([
      
    ])
    
    NSLayoutConstraint.activate([
      //      scrollView.widthAnchor.constraint(equalToConstant: 800),
      //      scrollView.heightAnchor.constraint(equalToConstant: 400),
      //      scrollView.topAnchor.constraint(equalTo: view.topAnchor),
      //      scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      //      scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      //      scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    ])
    
  }
  
  
  func style() {
    pageControl.translatesAutoresizingMaskIntoConstraints = false
    pageControl.currentPageIndicatorTintColor = .black
    pageControl.pageIndicatorTintColor = .systemGray2
    pageControl.numberOfPages = pages.count
    pageControl.currentPage = initialPage
  }
  
  func layout() {
    view.addSubview(pageControl)
    
    NSLayoutConstraint.activate([
      pageControl.widthAnchor.constraint(equalTo: view.widthAnchor),
      pageControl.heightAnchor.constraint(equalToConstant: 20),
      view.bottomAnchor.constraint(equalToSystemSpacingBelow: pageControl.bottomAnchor, multiplier: 1),
    ])
  }
  
  @objc func pageControlTapped(_ sender: UIPageControl) {
    setViewControllers([pages[sender.currentPage]], direction: .forward, animated: true, completion: nil)
  }
  
  override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
    super.init(transitionStyle: .pageCurl, navigationOrientation: .horizontal, options: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
  }
  
}

extension ViewController: UIPageViewControllerDataSource {
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    
    guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
    
    if currentIndex == 0 {
      return pages.last               // wrap to last
    } else {
      return pages[currentIndex - 1]  // go previous
    }
  }
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    
    guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
    
    if currentIndex < pages.count - 1 {
      return pages[currentIndex + 1]  // go next
    } else {
      return pages.first              // wrap to first
    }
  }
}

extension ViewController: UIPageViewControllerDelegate {
  
  // How we keep our pageControl in sync with viewControllers
  func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
    
    guard let viewControllers = pageViewController.viewControllers else { return }
    guard let currentIndex = pages.firstIndex(of: viewControllers[0]) else { return }
    
    pageControl.currentPage = currentIndex
  }
}

