//
//  Experiment01ViewController.swift
//  experiment-message-tap-back
//
//  Created by Dominic Go on 11/7/23.
//

import UIKit
import MessageUI

fileprivate class AuxiliaryViewController: UIViewController {

  init() {
    super.init(nibName: nil, bundle: nil);
    self.preferredContentSize = .init(width: 125, height: 75);
  };
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  };
  
  override func viewDidLoad() {
    super.viewDidLoad();
    
    self.view.backgroundColor = .white;
    self.view.layer.cornerRadius = 12;
  };
};


class Experiment01ViewController: UIViewController {

  var boxView: UIView?;

  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .white;
    
    let stackView: UIStackView = {
      let stack = UIStackView();
      
      stack.axis = .vertical;
      stack.distribution = .fillProportionally;
      stack.alignment = .center;
      stack.spacing = 20;
                
      return stack;
    }();
    
    let itemCount = 30;
    let itemCountMid = Int(itemCount / 2);
    
    for index in 0 ..< itemCountMid {
      let label = UILabel();
      
      label.text = "\(index)";
      label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5);
      label.alpha = 0.3;
      label.font = .boldSystemFont(ofSize: 22);

      stackView.addArrangedSubview(label);
    };
    
    let box: UIView = {
      let view = UIView();
      
      view.backgroundColor = .red;
      view.layer.cornerRadius = 10;

      return view;
    }();
    
    self.boxView = box;
    
    box.translatesAutoresizingMaskIntoConstraints = false;
    stackView.addArrangedSubview(box);
    
    NSLayoutConstraint.activate([
      box.widthAnchor.constraint(equalToConstant: 200),
      box.heightAnchor.constraint(equalToConstant: 100),
    ]);
    
    let button: UIView = {
      let button = UIButton(frame: .zero);
      button.setTitle("Show Context Menu", for: .normal);
      
      if #available(iOS 15.0, *) {
        button.configuration = .filled()
      };
      
      button.addTarget(self,
        action: #selector(Self.handleButtonPress(_:)),
        for: .touchUpInside
      );
      
      return button;
    }();
    
    stackView.addArrangedSubview(button);
    
    for index in itemCountMid...itemCount {
      let label = UILabel();
      
      label.text = "\(index)";
      label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5);
      label.alpha = 0.3;
      label.font = .boldSystemFont(ofSize: 22);

      stackView.addArrangedSubview(label);
    };
    
    let scrollView: UIScrollView = {
      let scrollView = UIScrollView();
      
      scrollView.showsHorizontalScrollIndicator = false;
      scrollView.showsVerticalScrollIndicator = true;
      return scrollView
    }();
    
    stackView.translatesAutoresizingMaskIntoConstraints = false;
    scrollView.addSubview(stackView);
    
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(
        equalTo: scrollView.topAnchor,
        constant: 40
      ),
      
      stackView.bottomAnchor.constraint(
        equalTo: scrollView.bottomAnchor,
        constant: -100
      ),
      
      stackView.centerXAnchor.constraint(
        equalTo: scrollView.centerXAnchor
      ),
    ]);
    
    scrollView.translatesAutoresizingMaskIntoConstraints = false;
    self.view.addSubview(scrollView);
    
    NSLayoutConstraint.activate([
      scrollView.topAnchor     .constraint(equalTo: self.view.topAnchor     ),
      scrollView.bottomAnchor  .constraint(equalTo: self.view.bottomAnchor  ),
      scrollView.leadingAnchor .constraint(equalTo: self.view.leadingAnchor ),
      scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
    ]);
  };
  
  @objc func handleButtonPress(_ sender: UIButton){
    guard let boxView = self.boxView else { return };
  
    let manager = ModalManager();
    let auxVC = AuxiliaryViewController();
    
    manager.present(
      viewControllerToPresent: auxVC,
      presentingViewController: self,
      targetView: boxView
    );
  };
};

  
