//
//  FlutterView.m
//  MultipleFluttersIos
//
//  Created by oneko on 2021/6/1.
//

#import "FlutterView.h"
#import "MultipleFluttersIos-Swift.h"

@interface InvokeObject: NSObject

@property (nonatomic, copy)     NSString    *invokeMethod;
@property (nonatomic, strong)   id          arguments;

+ (instancetype)object:(NSString *)invokeMethod arguments:(id)arguments;

@end

@implementation InvokeObject

+ (instancetype)object:(NSString *)invokeMethod arguments:(id)arguments {
    InvokeObject *obj = [InvokeObject new];
    obj.invokeMethod = invokeMethod;
    obj.arguments = arguments;
    return obj;
}

@end


@interface FlutterView ()

@property (nonatomic, weak) UIViewController    *embedingController;
@property (nonatomic, weak) FlutterContainerViewController    *embededController;
@property (nonatomic, copy) NSString            *viewIdentifier;
@property (nonatomic, strong) NSMutableArray    *invokeList;
@property (nonatomic, copy) FlutterCallBlock    flutterCallBlock;

@end

@implementation FlutterView

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

- (void)updateView:(NSString *)viewName viewModel:(id)viewModel {
    if (self.embededController) {
        [self.embededController updateView:viewName];
    } else {
        [_invokeList addObject:[InvokeObject object:@"updateView" arguments:viewName]];
    }
}

- (void)setFlutterCallBlock:(FlutterCallBlock)block {
    _flutterCallBlock = block;
    
    if (self.embededController) {
        [self setFlutterInvokeBlock];
    }
}

- (void)setFlutterInvokeBlock {
    __weak FlutterView *wself = self;
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
        
        for (InvokeObject *obj in self.invokeList) {
            [self.embededController updateView:obj.arguments];
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
    
    [self.embedingController addChildViewController:vc];
    
    vc.view.frame = self.bounds;
    [self addSubview:vc.view];
    
    [vc didMoveToParentViewController:self.embedingController];
    
    self.embededController = vc;
}

@end
