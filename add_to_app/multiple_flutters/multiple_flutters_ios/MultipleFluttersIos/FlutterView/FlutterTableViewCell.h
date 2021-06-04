//
//  FlutterTableViewCell.h
//  MultipleFluttersIos
//
//  Created by oneko on 2021/6/4.
//

#import <UIKit/UIKit.h>
#import "FlutterView.h"

NS_ASSUME_NONNULL_BEGIN

@interface FlutterTableViewCell : UITableViewCell

@property (nonatomic, strong, nullable) FlutterView *flutterView;

@end

NS_ASSUME_NONNULL_END
