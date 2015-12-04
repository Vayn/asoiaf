//
//  MJRefreshSpinnerFooter.m
//
//

#import "MJRefreshSpinnerFooter.h"
#import "Spinner.h"

@interface MJRefreshSpinnerFooter ()

@property (strong, nonatomic) Spinner *spinner;

@end

@implementation MJRefreshSpinnerFooter

#pragma mark - 懒加载

#pragma mark - 公共方法

- (void)setSpinner:(Spinner *)spinner forState:(MJRefreshState)state
{ 
    if (spinner == nil) return;

    self.spinner = spinner;
    [self addSubview:self.spinner];

    /* 根据图片设置控件的高度 */ 
    if (spinner.animatedImage.size.height > self.mj_h) {
        self.mj_h = spinner.animatedImage.size.height;
    } 
}

#pragma mark - 实现父类的方法
- (void)setPullingPercent:(CGFloat)pullingPercent
{
    [super setPullingPercent:pullingPercent];
}

- (void)placeSubviews
{
    [super placeSubviews];
    
    if (self.spinner.constraints.count) return;
    
    self.spinner.frame = self.bounds;
    if (self.stateLabel.hidden && self.lastUpdatedTimeLabel.hidden) {
        self.spinner.contentMode = UIViewContentModeCenter;
    } else {
        self.spinner.contentMode = UIViewContentModeRight;
        self.spinner.mj_w = self.mj_w * 0.5 - 90;
    }
}

- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState

    if (!self.spinner) return;

    // 根据状态做事情
    if (state == MJRefreshStatePulling || state == MJRefreshStateRefreshing) {
        [self.spinner startAnimating];
    } else if (state == MJRefreshStateIdle) {
        [self.spinner stopAnimating];
    }
}

@end