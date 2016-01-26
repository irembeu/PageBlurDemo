//
//  ViewController.m
//  WPAttributedLabelTest
//
//  Created by 刘光军 on 16/1/26.
//  Copyright © 2016年 刘光军. All rights reserved.
//

#import <CoreText/CoreText.h>
#import "ViewController.h"

#import "NSString+WPAttributedMarkup.h"

#import "WPAttributedStyleAction.h"
#import "WPHotspotLabel.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UILabel *labelOne;
@property (strong, nonatomic) IBOutlet UILabel *labelTwo;
@property (strong, nonatomic) IBOutlet WPHotspotLabel *labelThree;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDictionary* style1 = @{@"body":[UIFont fontWithName:@"HelveticaNeue" size:18.0],
                             @"bold":[UIFont fontWithName:@"HelveticaNeue-Bold" size:18.0],
                             @"red": [UIColor redColor],
                             @"blue":[UIColor blueColor]};
    
    NSDictionary* style2 = @{@"body" :
                                 @[[UIFont fontWithName:@"HelveticaNeue-Bold" size:18.0],
                                   [UIColor darkGrayColor]],
                             @"u": @[[UIColor blueColor],
                                     @{NSUnderlineStyleAttributeName : @(kCTUnderlineStyleSingle|kCTUnderlinePatternSolid)}
                                     ],
                             @"point":[UIImage imageNamed:@"redPoint"] };
    
    NSDictionary* style3 = @{@"body":[UIFont fontWithName:@"HelveticaNeue" size:22.0],
                             @"blue":[WPAttributedStyleAction styledActionWithAction:^{
                                 self.view.backgroundColor = [UIColor blueColor];
                             }],
                             @"orange":[WPAttributedStyleAction styledActionWithAction:^{
                                 self.view.backgroundColor = [UIColor orangeColor];
                             }],
                             @"link": [UIColor greenColor]};
    
    self.labelOne.attributedText = [@"我被设置成 <bold>粗体</bold> 我可以是<red>红色的</red> 也可以是<blue>绿色的</red>的文字" attributedStringWithStyleBook:style1];
    self.labelTwo.attributedText = [@"<point> </point> 字体 <u>样式</u> +图片 <point> </point>" attributedStringWithStyleBook:style2];
    self.labelThree.attributedText = [@"可以点击背景变色 <blue>蓝色</blue> 也可以点击变成 <orange>橙色</orange> 试一试" attributedStringWithStyleBook:style3];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
