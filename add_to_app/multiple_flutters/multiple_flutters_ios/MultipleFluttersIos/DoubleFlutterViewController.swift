// Copyright 2021 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import UIKit

/// A UIViewController that hosts two instances of SingleFlutterViewController, splitting the screen
/// between them.
class DoubleFlutterViewController: UIViewController {
  private let topFlutter: SingleFlutterViewController = SingleFlutterViewController(
    withEntrypoint: "topMain")
  private let bottomFlutter: SingleFlutterViewController = SingleFlutterViewController(
    withEntrypoint: "bottomMain")

  override func viewDidLoad() {
    addChild(topFlutter)
    addChild(bottomFlutter)
    let safeFrame: CGRect
    if #available(iOS 11.0, *) {
        safeFrame = self.view.safeAreaLayoutGuide.layoutFrame
    } else {
        // Fallback on earlier versions
        safeFrame = self.view.bounds
    }
    let halfHeight = safeFrame.height / 2.0
    topFlutter.view.frame = CGRect(
      x: safeFrame.minX, y: safeFrame.minY, width: safeFrame.width, height: halfHeight)
    bottomFlutter.view.frame = CGRect(
      x: safeFrame.minX, y: topFlutter.view.frame.maxY, width: safeFrame.width, height: halfHeight)
    self.view.addSubview(topFlutter.view)
    self.view.addSubview(bottomFlutter.view)
    topFlutter.didMove(toParent: self)
    bottomFlutter.didMove(toParent: self)
  }
}
