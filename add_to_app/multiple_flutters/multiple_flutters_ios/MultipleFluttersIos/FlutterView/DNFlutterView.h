//
//  FlutterView.h
//  MultipleFluttersIos
//
//  Created by oneko on 2021/6/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^FlutterCallBlock)(NSString *, id);

@interface DNFlutterView : UIView

- (instancetype)initWithController:(UIViewController *)controller
                    viewIdentifier:(NSString *)viewIdentifier;
- (void)updateView:(NSString *)viewName viewModel:(NSDictionary *)viewModel;
- (void)setFlutterCallBlock:(FlutterCallBlock)block;

@end

NS_ASSUME_NONNULL_END
