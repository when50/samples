//
//  FlutterView.m
//  MultipleFluttersIos
//
//  Created by oneko on 2021/6/1.
//

#import "DNFlutterView.h"
#import "MultipleFluttersIos-Swift.h"

@interface UpdateViewObject: NSObject

@property (nonatomic, copy)     NSString        *viewName;
@property (nonatomic, strong)   NSDictionary    *viewModel;

+ (instancetype)viewName:(NSString *)viewName viewModel:(NSDictionary *)viewModel;

@end

@implementation UpdateViewObject

+ (instancetype)viewName:(NSString *)viewName viewModel:(NSDictionary *)viewModel {
    UpdateViewObject *obj = [UpdateViewObject new];
    obj.viewName = viewName;
    obj.viewModel = viewModel;
    return obj;
}

@end


@interface DNFlutterView ()

@property (nonatomic, weak) UIViewController    *embedingController;
@property (nonatomic, weak) FlutterContainerViewController    *embededController;
@property (nonatomic, copy) NSString            *viewIdentifier;
@property (nonatomic, strong) NSMutableArray    *invokeList;
@property (nonatomic, copy) FlutterCallBlock    flutterCallBlock;

@end

@implementation DNFlutterView

- (void)dealloc {
    if (_embededController) {
        [FlutterContainerViewController cacheWithViewController:_embededController];
    }
}

- (instancetype)initWithController:(UIViewController *)controller
                    viewIdentifier:(NSString *)viewIdentifier {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        _embedingController = controller;
        _viewIdentifier = viewIdentifier;
        _invokeList = [NSMutableArray array];
    }
    return self;
}

- (void)updateView:(NSString *)viewName viewModel:(NSDictionary *)viewModel {
    if (self.embededController) {
        [self.embededController updateViewWithViewName:viewName viewModel:viewModel];
    } else {
        [_invokeList addObject:[UpdateViewObject viewName:viewName viewModel:viewModel]];
    }
}

- (void)setFlutterCallBlock:(FlutterCallBlock)block {
    _flutterCallBlock = block;
    
    if (self.embededController) {
        [self setFlutterInvokeBlock];
    }
}

- (void)setFlutterInvokeBlock {
    __weak DNFlutterView *wself = self;
    self.embededController.flutterInvokeBlock = ^(NSString * _Nonnull method, id _Nonnull argugments) {
        if (wself.flutterCallBlock) {
            wself.flutterCallBlock(method, argugments);
        }
    };
}

- (void)didMoveToWindow {
    if (self.window) {
        if (self.embededController == nil) {
            [self loadFlutterView];
        }
        
        for (UpdateViewObject *obj in self.invokeList) {
            [self.embededController updateViewWithViewName:obj.viewName viewModel:obj.viewModel];
        }
        [self.invokeList removeAllObjects];
        
        
        [self setFlutterInvokeBlock];
    } else {
        if (self.embededController) {
            [FlutterContainerViewController cacheWithViewController:self.embededController];
        }
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.embededController.view.frame = self.bounds;
}

#pragma mark - private
- (void)loadFlutterView {
    FlutterContainerViewController *vc = [FlutterContainerViewController viewController];
    if (vc == nil) {
        vc =  [[FlutterContainerViewController alloc] initWithEntrypoint:self.viewIdentifier libraryURI:nil];
    }
    
    [self attachFlutterView:vc];
    
    self.embededController = vc;
}

- (void)attachFlutterView:(FlutterViewController *)viewController {
    [self.embedingController addChildViewController:viewController];
    
    viewController.view.frame = self.bounds;
    [self addSubview:viewController.view];
    
    [viewController didMoveToParentViewController:self.embedingController];
}

@end
