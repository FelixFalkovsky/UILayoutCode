//
//  OnBoardingViewController.swift
//  UILayoutCode
//
//  Created by Felix on 22.11.2021.
//

import UIKit

class OnBoardingView: UIView, UIScrollViewDelegate {
  
  public override var intrinsicContentSize: CGSize {
    .init(width: UIView.layoutFittingExpandedSize.width, height: super.intrinsicContentSize.height)
  }
  
  private let customView = UIView()
  var completionHandler: (() -> Void)?
  
  private let scrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.isMultipleTouchEnabled = true
    scrollView.isUserInteractionEnabled = true
    scrollView.contentMode = .scaleAspectFill
    scrollView.isScrollEnabled = true
    scrollView.showsHorizontalScrollIndicator = false
    scrollView.showsVerticalScrollIndicator = false
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    scrollView.backgroundColor = .systemBackground
    return scrollView
  }()
  
  private let view: UIView = {
    let view = UIView()
    view.backgroundColor = .clear
    return view
  }()
  
  private var bgImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.isUserInteractionEnabled = true
    imageView.contentMode = .scaleAspectFill
    imageView.image = UIImage()
    imageView.backgroundColor = .systemBlue
//    imageView.systemLayoutSizeFitting(CGSize(width: 251, height: 251), withHorizontalFittingPriority: CGSize(251), verticalFittingPriority: 251)
    return imageView
  }()
  
  private let verticalStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.alignment = .fill
    stackView.isLayoutMarginsRelativeArrangement = false
    return stackView
  }()
  
  private let contentTextStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.alignment = .center
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
    label.font = UIFont.boldSystemFont(ofSize: 23)
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
  
  @objc private let nextButton: UIButton = {
    let button = UIButton()
    button.setTitle("Дальше", for: .normal)
    button.layer.cornerRadius = 25
    button.layer.backgroundColor = UIColor.systemGreen.cgColor
    button.addTarget(self, action: #selector(nextAction), for: .touchUpInside)
    return button
  }()
  
  override init(frame: CGRect) {
    super.init(frame: .zero)
    backgroundColor = .systemBackground
    scrollView.delegate = self
    addSubview(view)
    addSubview(bgImageView)
    view.addSubview(scrollView)
    view.addSubview(bgImageView)
    scrollView.addSubview(verticalStackView)
    verticalStackView.addSubview(imageView)
    
  //  addingSubviewsForAutoLayout([
     // scrollView.addingSubviewsForAutoLayout([
//        verticalStackView.addingArrangedSubviews([
//          imageView,
//          contentTextStackView.addingArrangedSubviews([
//            titleLabel,
//            descriptionLabel
//          ])
//        ]),
//        nextButton
     // ])
   // ])
    
    NSLayoutConstraint.activate([
      view.topAnchor.constraint(equalTo: topAnchor),
      view.bottomAnchor.constraint(equalTo: bottomAnchor),
      view.leadingAnchor.constraint(equalTo: leadingAnchor),
      view.trailingAnchor.constraint(equalTo: trailingAnchor),
      view.centerXAnchor.constraint(equalTo: centerXAnchor),
      view.centerYAnchor.constraint(equalTo: centerYAnchor),
      
      bgImageView.widthAnchor.constraint(equalToConstant: 400),
      bgImageView.heightAnchor.constraint(equalToConstant: 400),
      
      scrollView.topAnchor.constraint(equalTo: topAnchor),
      scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
      scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
      scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
      scrollView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
      scrollView.widthAnchor.constraint(equalToConstant: 900),

      verticalStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
      verticalStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
      verticalStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
      verticalStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),

      imageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 2),
      imageView.topAnchor.constraint(equalTo: verticalStackView.topAnchor),
      imageView.leadingAnchor.constraint(equalTo: verticalStackView.leadingAnchor),
      imageView.trailingAnchor.constraint(equalTo: verticalStackView.trailingAnchor),
//
//      nextButton.heightAnchor.constraint(equalToConstant: 50),
//      nextButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
//      nextButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
//      nextButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
    ])
    titleLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
    descriptionLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
 
  @objc
  private func nextAction() {
    print("PRESS")
    completionHandler?()
    reloadInputViews()
  }
  
  public func configure(
    title: String?,
    description: String?,
    image: UIImage,
    buttonTitle: String?
  ) {
    titleLabel.text = title
    titleLabel.isHidden = title == nil
    
    descriptionLabel.text = description
    descriptionLabel.isHidden = description == nil
    
    imageView.image = image
    
    nextButton.setTitle(buttonTitle, for: .normal)
    nextButton.isHidden = buttonTitle == nil
  }
  
}
