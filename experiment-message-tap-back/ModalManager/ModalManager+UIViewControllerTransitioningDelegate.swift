//
//  ModalManager+UIViewControllerTransitioningDelegate.swift
//  experiment-message-tap-back
//
//  Created by Dominic Go on 11/7/23.
//

import Foundation
import UIKit

extension ModalManager: UIViewControllerTransitioningDelegate {

  func presentationController(
    forPresented presented: UIViewController,
    presenting: UIViewController?,
    source: UIViewController
  ) -> UIPresentationController? {
    
    let presentationController = ModalPresentationController(
      presentedViewController: presented,
      presenting: presenting,
      modalManager: self
    );
    
    presentationController.delegate = self;
    return presentationController;
  };
  
  func animationController(
    forPresented presented: UIViewController,
    presenting: UIViewController,
    source: UIViewController
  ) -> UIViewControllerAnimatedTransitioning? {
    
    self.presentationState = .presenting;
    return self;
  };

  func animationController(
    forDismissed dismissed: UIViewController
  ) -> UIViewControllerAnimatedTransitioning? {
    
    self.presentationState = .dismissing;
    return self;
  };
};
