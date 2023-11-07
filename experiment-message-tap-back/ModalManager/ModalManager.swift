//
//  ModalManager.swift
//  experiment-message-tap-back
//
//  Created by Dominic Go on 11/7/23.
//

import UIKit

class ModalManager: NSObject {

  weak var presentingVC: UIViewController?;
  weak var targetView: UIView?;
  
  var presentedVC: UIViewController?;

  override init() {
    super.init();
  };
  
  func present(
    viewControllerToPresent presentedVC: UIViewController,
    presentingViewController presentingVC: UIViewController,
    targetView: UIView
  ) {
    
    self.presentedVC = presentedVC;
    self.presentingVC = presentingVC;
    self.targetView = targetView;
    
    presentedVC.modalPresentationStyle = .custom;
    presentedVC.transitioningDelegate = self;
    
    presentingVC.present(presentedVC, animated: true);
  };
};
