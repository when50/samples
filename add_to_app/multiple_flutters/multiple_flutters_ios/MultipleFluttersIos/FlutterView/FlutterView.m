//
//  FlutterView.m
//  MultipleFluttersIos
//
//  Created by oneko on 2021/6/1.
//

#import "FlutterView.h"
#import "MultipleFluttersIos-Swift.h"

@interface FlutterView ()

@property (nonatomic, weak) UIViewController    *embedingController;
@property (nonatomic, weak) UIViewController    *embededController;
@property (nonatomic, copy) NSString            *viewIdentifier;

@end

@implementation FlutterView

- (instancetype)initWithController:(UIViewController *)controller
                    viewIdentifier:(NSString *)viewIdentifier {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        _embedingController = controller;
        _viewIdentifier = viewIdentifier;
    }
    return self;
}

- (void)didMoveToWindow {
    if (self.window) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            [self loadFlutterView];
        });
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.embededController.view.frame = self.bounds;
}

#pragma mark - private
- (void)loadFlutterView {
    
    SingleFlutterViewController *vc = [[SingleFlutterViewController alloc] initWithEntrypoint:@"cell1" libraryURI:@"cell1.dart"];
    
    [self.embedingController addChildViewController:vc];
    
    vc.view.frame = self.bounds;
    [self addSubview:vc.view];
    
    [vc didMoveToParentViewController:self.embedingController];
    
    self.embededController = vc;
}

@end
