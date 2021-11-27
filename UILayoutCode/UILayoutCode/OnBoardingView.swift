//
//  OnBoardingViewController.swift
//  UILayoutCode
//
//  Created by Felix on 22.11.2021.
//

import UIKit

class OnBoardingView: UIView {
  
  public override var intrinsicContentSize: CGSize {
    .init(width: UIView.layoutFittingExpandedSize.width, height: super.intrinsicContentSize.height)
  }
  
  private let customView = UIView()
  
  private let contentStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.alignment = .fill
    stackView.isLayoutMarginsRelativeArrangement = false
    return stackView
  }()
  
  private var imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "onBoardingFier")
    imageView.contentMode = .scaleAspectFill
    return imageView
  }()
  
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "Привет"
    label.textColor = UIColor.black
    label.numberOfLines = 0
    label.layoutMargins = UIEdgeInsets(top: 2, left: 4, bottom: 2, right: 4)
    return label
  }()
  
  private let descriptionLabel: UILabel = {
    let label = UILabel()
    label.text = "Привет"
    label.textColor = UIColor.black
    label.numberOfLines = 0
    label.layoutMargins = UIEdgeInsets(top: 2, left: 4, bottom: 2, right: 4)
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: .zero)
    
    backgroundColor = UIColor.systemBlue
    
    addingSubviewsForAutoLayout([
      contentStackView.addingArrangedSubviews([
        imageView
      ]),
      titleLabel,
      descriptionLabel
    ])
    
    NSLayoutConstraint.activate([
      titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
      descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor)
    ])
    titleLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
    descriptionLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
