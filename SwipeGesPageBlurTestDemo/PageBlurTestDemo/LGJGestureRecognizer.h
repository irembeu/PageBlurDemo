//
//  LGJGestureRecognizer.h
//  PageBlurTestDemo
//
//  Created by iOS002 on 16/1/15.
//  Copyright © 2016年 刘光军. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, Direction) {
    DirectionUnknown,
    DirectionLeft,
    DirectionRight
    };

@interface LGJGestureRecognizer : UIGestureRecognizer

@property (assign, nonatomic) NSUInteger tickleCount; //挠痒次数
@property (assign, nonatomic) CGPoint currentTickleStart; //当前挠痒开始坐标位置
@property (assign, nonatomic) Direction lastDirection; //最后一次挠痒方向


@end
