//
//  ModalManager.swift
//  experiment-message-tap-back
//
//  Created by Dominic Go on 11/7/23.
//

import UIKit

class ModaWrappertViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad();
    
    self.view.backgroundColor = .clear;
  };
};

class ModalManager: NSObject {

  // MARK: - Embedded Types
  // ----------------------
  
  enum PresentationState {
    case presenting;
    case dismissing;
  };
  
  // MARK: - Properties
  // ------------------

  weak var presentingVC: UIViewController?;
  weak var targetView: UIView?;

  
  var modalWrapperVC: ModaWrappertViewController?;
  var presentedVC: UIViewController?;
  
  var presentationState: PresentationState?;

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
    
    let modalWrapperVC = ModaWrappertViewController();
    self.modalWrapperVC = modalWrapperVC;
    
    
    modalWrapperVC.addChild(presentedVC);
    modalWrapperVC.didMove(toParent: presentedVC);
    
    modalWrapperVC.modalPresentationStyle = .custom;
    modalWrapperVC.transitioningDelegate = self;
    
    self.presentationState = .presenting;
    
    presentingVC.present(modalWrapperVC, animated: true);
  };
};
