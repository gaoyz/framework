
//
//  NDReaderPageBar.m
//  NonDegree
//
//  Created by liusq on 13-3-26.
//  Copyright (c) 2013年 nd. All rights reserved.
//

#import "NDReaderPageBar.h"
#import "ReaderDocument.h"

@interface NDReaderPageBar ()

@property (nonatomic, retain) UISlider  *pageSlider;
@property (nonatomic, retain) UILabel   *popLabel;
@property (nonatomic, retain) NSTimer   *timer;
@property (nonatomic, retain) UIView       *popView;
//@property (nonatomic, strong) UIView       *bufferImgView;
@property (nonatomic, retain) ReaderDocument    *document;

@end

@implementation NDReaderPageBar

- (id)initWithFrame:(CGRect)frame
{
    self = [self initWithFrame:frame document:nil];
    if (self) {
        // Initialization code
    }
    return self;
}

//TODO: 初始化
- (id)initWithFrame:(CGRect)frame document:(ReaderDocument *)document
{
    self = [super initWithFrame:frame];
    if (self) {
        //
        _document = document;
        [self loadUI];
    }
    return self;
}
- (void)loadUI
{
    self.autoresizesSubviews = YES;
    self.userInteractionEnabled = YES;
    self.contentMode = UIViewContentModeRedraw;
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    self.backgroundColor = [UIColor clearColor];
    
    
    _pageSlider = [[UISlider alloc] initWithFrame:CGRectMake(10, 0, self.bounds.size.width-20, self.bounds.size.height)];
    _pageSlider.autoresizesSubviews = YES;
    _pageSlider.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin |UIViewAutoresizingFlexibleWidth;
    UIImage *originMinImg = [UIImage imageNamed:@"ReaderRes.bundle/minTrack.png"];
    UIImage *minImg = [originMinImg stretchableImageWithLeftCapWidth:originMinImg.size.width/2 topCapHeight:0];
    UIImage *originMaxImg = [UIImage imageNamed:@"ReaderRes.bundle/maxTrack.png"];
    UIImage *maxImg = [originMaxImg stretchableImageWithLeftCapWidth:originMaxImg.size.width/2 topCapHeight:0];
    UIImage *thumbImg = [UIImage imageNamed:@"ReaderRes.bundle/thumbTrack.png"];
    [_pageSlider setMinimumTrackImage:minImg forState:UIControlStateNormal];
    [_pageSlider setMaximumTrackImage:maxImg forState:UIControlStateNormal];
    [_pageSlider setThumbImage:thumbImg forState:UIControlStateNormal];
    _pageSlider.minimumValue = 1;
    _pageSlider.maximumValue = [_document.pageCount intValue];
    _pageSlider.value = [_document.pageNumber intValue];
    [_pageSlider addTarget:self action:@selector(updatePageBar:) forControlEvents:UIControlEventValueChanged];
    [_pageSlider addTarget:self action:@selector(updatePage) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_pageSlider];
    
    
    UIImage *floatImg = [UIImage imageNamed:@"ReaderRes.bundle/float.png"];
    _popView = [[UIView alloc] initWithFrame:CGRectMake(0, -10, floatImg.size.width, floatImg.size.height)];
    [_popView setBackgroundColor:[UIColor colorWithPatternImage:floatImg]];
    [_popView setAlpha:0.f];
    [_popView setHidden:YES];
    [_pageSlider addSubview:_popView];
    
    _popLabel = [[UILabel alloc] initWithFrame:CGRectMake( 2.5, 2, _popView.frame.size.width-5, _popView.frame.size.height/2)];
    [_popLabel setTextAlignment:UITextAlignmentCenter];
    [_popLabel setTextColor:[UIColor whiteColor]];
    [_popLabel setBackgroundColor:[UIColor clearColor]];
    [_popLabel setAlpha:0.f];
    [_popLabel setFont:[UIFont systemFontOfSize:10.0f]];
    [_popView addSubview:_popLabel];
    
    //进入默认显示页数
    [self updatePageBar:_pageSlider];
}

- (void)updatePage
{
    NSInteger pageIndex = ceilf(_pageSlider.value);
    [_delegate pageBarGotoPage:pageIndex];
}

//TODO: 控制pageBar的函数
- (void)updatePageBar:(id)sender
{
    UISlider *slider = (UISlider *)sender;
    NSInteger pageIndex = ceilf(slider.value);
    
    CGRect theRect = slider.frame;
    CGFloat x = (CGFloat)slider.value/(CGFloat)([_document.pageCount intValue]+1);

    NSLog(@"x=%f,w=%f",x,theRect.size.width);
    [_popView setFrame:CGRectMake(x*(theRect.size.width-15)-3, -16, _popView.frame.size.width, _popView.frame.size.height)];
    [_popLabel setText:[NSString stringWithFormat:@"%d",pageIndex]];
    if (pageIndex>=100) {
        [_popLabel setFont:[UIFont systemFontOfSize:8.0f]];
    }
    else{
         [_popLabel setFont:[UIFont systemFontOfSize:10.0f]];
    }
    
    [UIView animateWithDuration:0.5
                     animations:^{
                         [_popView setAlpha:1.f];
                         [_popLabel setAlpha:1.f];
                     }
                     completion:^(BOOL finished){
                         // 动画结束时的处理
                     }];
    
    [_timer invalidate];
    _timer = nil;
    _timer = [NSTimer scheduledTimerWithTimeInterval:2
                                             target:self
                                           selector:@selector(disPopView)
                                           userInfo:nil repeats:NO];
    
    NSLog(@"%d",pageIndex);
}

- (void)setPageValue:(CGFloat)value
{
    _pageSlider.value = value;
}

- (void)disPopView{
    
    [UIView animateWithDuration:0.5
                     animations:^{
                         [_popView setAlpha:0.f];
                         [_popLabel setAlpha:0.f];
                     }
                     completion:^(BOOL finished){
                         // 动画结束时的处理
                     }];
    
}

- (void)hidePageBar
{
    self.hidden = YES;
}

- (void)showPageBar
{
    self.hidden = NO;
}

- (void)hidePopView
{
    _popView.hidden = YES;
}

- (void)showPopView
{
    _popView.hidden = NO;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
