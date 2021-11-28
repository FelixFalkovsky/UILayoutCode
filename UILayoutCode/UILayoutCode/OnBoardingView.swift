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
    imageView.contentMode = .scaleToFill
    return imageView
  }()
  
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: "Halvetica", size: 23)
    label.text = "Выбор плана питания"
    label.textColor = UIColor.black
    label.numberOfLines = 0
    label.layoutMargins = UIEdgeInsets(top: 2, left: 4, bottom: 2, right: 4)
    return label
  }()
  
  private let descriptionLabel: UILabel = {
    let label = UILabel()
    label.text = "8 самых популярных программ питания со всего мира"
    label.textColor = UIColor.black
    label.textAlignment = .center
    label.numberOfLines = 3
    label.layoutMargins = UIEdgeInsets(top: 2, left: 4, bottom: 2, right: 4)
    return label
  }()
  
  private let nextButton: UIButton = {
    let button = UIButton()
    button.setTitle("Дальше", for: .normal)
    button.layer.cornerRadius = 25
    button.layer.backgroundColor = UIColor.systemBlue.cgColor
    return button
  }()
  
  override init(frame: CGRect) {
    super.init(frame: .zero)
    backgroundColor = .systemBackground
    
    addingSubviewsForAutoLayout([
      contentStackView.addingSubviewsForAutoLayout([
        imageView
      ]),
      titleLabel,
      descriptionLabel,
      nextButton
    ])
    
    NSLayoutConstraint.activate([
      imageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 2),
      imageView.topAnchor.constraint(equalTo: topAnchor),
      imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
      imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
      
      titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
      titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
      
      descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
      descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
      descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
      
      nextButton.heightAnchor.constraint(equalToConstant: 50),
      nextButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
      nextButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
      nextButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
    ])
//    titleLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
//    descriptionLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
