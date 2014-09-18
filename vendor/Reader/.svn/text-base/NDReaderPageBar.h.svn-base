//
//  NDReaderPageBar.h
//  NonDegree
//
//  Created by liusq on 13-3-26.
//  Copyright (c) 2013年 nd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ReaderDocument;

@protocol NDReadPageBarDelegate <NSObject>

- (void)pageBarGotoPage:(NSInteger)pageIndex;

@end

@interface NDReaderPageBar : UIView

@property (nonatomic, unsafe_unretained, readwrite) id<NDReadPageBarDelegate> delegate;

    //TODO: 初始化
- (id)initWithFrame:(CGRect)frame document:(ReaderDocument *)document;
- (void)loadUI;

    //TODO: 控制pageBar的函数
- (void)updatePageBar:(id)sender;
- (void)setPageValue:(CGFloat)value;
- (void)hidePageBar;
- (void)showPageBar;
- (void)hidePopView;
- (void)showPopView;

@end
