//
//  FlutterView.h
//  MultipleFluttersIos
//
//  Created by oneko on 2021/6/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FlutterView : UIView

- (instancetype)initWithController:(UIViewController *)controller
                    viewIdentifier:(NSString *)viewIdentifier;
- (void)updateView:(NSString *)viewName;

@end

NS_ASSUME_NONNULL_END
