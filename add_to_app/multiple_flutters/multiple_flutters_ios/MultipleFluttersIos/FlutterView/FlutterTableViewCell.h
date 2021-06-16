//
//  FlutterTableViewCell.h
//  MultipleFluttersIos
//
//  Created by oneko on 2021/6/4.
//

#import <UIKit/UIKit.h>
#import "DNFlutterView.h"

NS_ASSUME_NONNULL_BEGIN

@interface FlutterTableViewCell : UITableViewCell

@property (nonatomic, strong, nullable) DNFlutterView *flutterView;

@end

NS_ASSUME_NONNULL_END
