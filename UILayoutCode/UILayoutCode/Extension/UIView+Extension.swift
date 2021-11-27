//
//  UIView+Extension.swift
//  UILayoutCode
//
//  Created by Felix on 27.11.2021.
//

import UIKit

public extension UIView {

    /// Adds the provided views, stops them from translating autoresizing constraints and returns self for compositional use
    /// - Parameter viewContainers: the views to be added
    func addSubviewsForAutoLayout(_ viewContainers: [ViewContainer]) {
        for view in viewContainers.views {
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
        }
    }

    /// Adds the provided views, stops them from translating autoresizing constraints and returns self for compositional use
    /// - Parameter viewContainers: the views to be added
    func addSubviewsForAutoLayout(_ viewContainers: ViewContainer...) {
        addSubviewsForAutoLayout(viewContainers)
    }

    /// Adds the provided views, stops them from translating autoresizing constraints and returns self for compositional use
    /// - Parameter views: the views to be added
    /// - Returns: this view
    func addingSubviewsForAutoLayout(_ viewContainers: [ViewContainer]) -> Self {
        addSubviewsForAutoLayout(viewContainers)
        return self
    }

    /// Adds the provided views, stops them from translating autoresizing constraints and returns self for compositional use
    /// - Parameter views: the views to be added
    /// - Returns: this view
    func addingSubviewsForAutoLayout(_ viewContainers: ViewContainer...) -> Self {
        addSubviewsForAutoLayout(viewContainers)
        return self
    }

    func tintColor(_ color: UIColor) -> Self {
        self.tintColor = color
        return self
    }

   func roundCorners(corners: CACornerMask, radius: CGFloat) {
        layer.cornerRadius = radius
        layer.maskedCorners = corners
   }

    /// Recursively find all subviews of a given view
    func getAllSubviews<ViewType: UIView>() -> [ViewType] {
        return subviews.flatMap { subView -> [ViewType] in
            var results: [ViewType] = subView.getAllSubviews()
            if let view = subView as? ViewType {
                results.append(view)
            }
            return results
        }
    }

    /// Helper to make a UIView with a given background color in one line
    func withBackgroundColor(_ color: UIColor) -> Self {
        backgroundColor = color
        return self
    }

}

