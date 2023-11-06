//
//  Routes.swift
//  experiment-message-tap-back
//
//  Created by Dominic Go on 11/7/23.
//

import Foundation


import UIKit

enum Route: CaseIterable {

  case experiment01;

  var viewController: UIViewController {
    switch self {
      case .experiment01:
        return Experiment01ViewController();
    };
  };
};
