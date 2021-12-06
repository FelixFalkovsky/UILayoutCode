//
//  CustomViewController.swift
//  UILayoutCode
//
//  Created by Felix on 05.12.2021.
//

import Foundation
import UIKit

/// ViewController helper subclass that is initialized with a custom view.
/// Usage: `class MyCustomViewController: CustomViewController<MyCustomView>
/// Custom view can be accessed with `self.customView`

open class CustomViewController<View: UIView>: ViewController, NavBarTabDelegate {

  // MARK: - Properties

  open var navBarTab: NavBar.Tab? {
    (children.first as? NavBarTabDelegate)?.navBarTab
  }

  public var customView: View {
    view as! View
  }

  override public var title: String? {
    didSet {
      if let title = title {
        navigationItem.titleView = SubtitleTitleView(title: title)
      }
    }
  }

  // MARK: - Life Cycle

  override public init() {
    super.init()
  }

  override open func loadView() {
    view = buildView(frame: UIScreen.main.bounds)
  }

  open func buildView(frame: CGRect) -> View {
    return View(frame: frame)
  }

  open func navBarTabChanged(to tab: NavBar.Tab) {
    (children.first as? NavBarTabDelegate)?.navBarTabChanged(to: tab)
  }

}
