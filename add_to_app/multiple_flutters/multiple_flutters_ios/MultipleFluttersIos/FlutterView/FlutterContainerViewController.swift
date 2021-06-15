// Copyright 2021 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import Flutter
import Foundation

/// A FlutterViewController intended for the MyApp widget in the Flutter module.
///
/// This view controller maintains a connection to the Flutter instance and syncs it with the
/// datamodel.  In practice you should override the other init methods or switch to composition
/// instead of inheritence.
class FlutterContainerViewController: FlutterViewController, DataModelObserver {
  private var channel: FlutterMethodChannel?
  static var cachePool = Set<FlutterContainerViewController>()
    @objc
    var flutterInvokeBlock: ((String, Any) -> Void)?
    
    @objc
    static func viewController() -> FlutterContainerViewController? {
        guard cachePool.count > 0 else { return nil }
        return cachePool.removeFirst()
    }
    
    @objc
    static func cache(viewController: FlutterContainerViewController) {
        cachePool.insert(viewController)
    }

  @objc
  init(withEntrypoint entryPoint: String?, libraryURI: String?) {
    let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    let newEngine = appDelegate.engines.makeEngine(withEntrypoint: entryPoint, libraryURI: libraryURI)
    super.init(engine: newEngine, nibName: nil, bundle: nil)
    DataModel.shared.addObserver(observer: self)
  }
    
    @objc
    func updateView(viewName: String, viewModel: [String: AnyHashable]) {
        let newViewModel: [String: AnyHashable] = [
            "viewName": viewName,
            "viewModel": viewModel
        ]
        channel!.invokeMethod("updateView", arguments: newViewModel)
    }

  deinit {
    NSLog(">>> FlutterViewController deinit")
    DataModel.shared.removeObserver(observer: self)
  }

  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func onCountUpdate(newCount: Int64) {
    if let channel = channel {
      channel.invokeMethod("setCount", arguments: newCount)
    }
  }
    
    override func didMove(toParent parent: UIViewController?) {
        guard let _ = parent else {
            channel = nil
            return
        }
        setupChannel()
    }
    
    @objc func setupChannel() {
        channel = FlutterMethodChannel(
          name: "setup-content", binaryMessenger: self.engine!.binaryMessenger)
        channel!.invokeMethod("setCount", arguments: DataModel.shared.count)
        if (self.navigationController == nil) {
            return;
        }
        let navController = self.navigationController!
        channel!.setMethodCallHandler { [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) in
            self?.flutterInvokeBlock?(call.method, call.arguments)
    //        if call.method == "click" {
    //            print("flutter call click")
    //        }
    //      else if call.method == "incrementCount" {
    //        DataModel.shared.count = DataModel.shared.count + 1
    //        result(nil)
    //      } else if call.method == "next" {
    //        let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //        let vc = storyboard.instantiateViewController(withIdentifier: "NativeViewCount")
    //        navController.pushViewController(vc, animated: true)
    //        result(nil)
    //      } else {
    //        result(FlutterMethodNotImplemented)
    //      }
        }
    }
}
