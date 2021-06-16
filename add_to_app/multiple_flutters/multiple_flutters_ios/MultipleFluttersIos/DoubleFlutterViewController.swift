// Copyright 2021 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import UIKit

/// A UIViewController that hosts two instances of SingleFlutterViewController, splitting the screen
/// between them.
class DoubleFlutterViewController: UIViewController {
  var topFlutter: SingleFlutterViewController!
  var bottomFlutter: SingleFlutterViewController!

  override func viewDidLoad() {
//    addChild(topFlutter)
//    addChild(bottomFlutter)
    let safeFrame: CGRect
    if #available(iOS 11.0, *) {
        safeFrame = self.view.safeAreaLayoutGuide.layoutFrame
    } else {
        // Fallback on earlier versions
        safeFrame = self.view.bounds
    }
    let halfHeight = safeFrame.height / 10.0
    for i in stride(from: 0, to: 10, by: 2) {
        topFlutter = SingleFlutterViewController(
            withEntrypoint: "topMain", libraryURI: nil)
        bottomFlutter = SingleFlutterViewController(
            withEntrypoint: "bottomMain", libraryURI: nil)
        addChild(topFlutter)
        addChild(bottomFlutter)
        topFlutter.view.frame = CGRect(
          x: safeFrame.minX, y: halfHeight * CGFloat(i), width: safeFrame.width, height: halfHeight)
        bottomFlutter.view.frame = CGRect(
          x: safeFrame.minX, y: topFlutter.view.frame.maxY, width: safeFrame.width, height: halfHeight)
        self.view.addSubview(topFlutter.view)
        self.view.addSubview(bottomFlutter.view)
        topFlutter.didMove(toParent: self)
        bottomFlutter.didMove(toParent: self)
    }
  }
}
