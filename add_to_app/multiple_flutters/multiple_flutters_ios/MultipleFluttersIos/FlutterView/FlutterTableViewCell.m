//
//  FlutterTableViewCell.m
//  MultipleFluttersIos
//
//  Created by oneko on 2021/6/4.
//

#import "FlutterTableViewCell.h"

@interface FlutterTableViewCell ()
@end

@implementation FlutterTableViewCell

- (void)setFlutterView:(DNFlutterView *)flutterView {
    _flutterView = flutterView;
    flutterView.frame = self.contentView.bounds;
    [self.contentView addSubview:flutterView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.flutterView.frame = self.contentView.bounds;
}

@end
