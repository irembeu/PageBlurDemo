//
//  ViewController.m
//  PageBlurTestDemo
//
//  Created by 刘光军 on 16/1/14.
//  Copyright © 2016年 刘光军. All rights reserved.
//

#import "ViewController.h"

typedef enum : NSUInteger {
    Fade = 1,                   //淡入淡出
    Push,                       //推挤
    Reveal,                     //揭开
    MoveIn,                     //覆盖
    Cube,                       //立方体
    SuckEffect,                 //吮吸
    OglFlip,                    //翻转
    RippleEffect,               //波纹
    PageCurl,                   //翻页
    PageUnCurl,                 //反翻页
    CameraIrisHollowOpen,       //开镜头
    CameraIrisHollowClose,      //关镜头
    CurlDown,                   //下翻页
    CurlUp,                     //上翻页
    FlipFromLeft,               //左翻转
    FlipFromRight,              //右翻转
    
} AnimationType;

@interface ViewController ()

@property(nonatomic, strong) NSArray* arr;/**< array */
@property(nonatomic, strong) UILabel* label;/**< label */

@end

@implementation ViewController
{
    NSInteger _count;
    UIBarButtonItem *_nextBtn;/**< 下一页 */
    UIBarButtonItem *_forwardBtn;/**< 上一页 */
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configNavBtn];
    [self configArr];
    [self buildLable];
    _count = 0;
}
#pragma mark - 导航栏按钮
- (void)configNavBtn {
    _nextBtn = [[UIBarButtonItem alloc] initWithTitle:@"next" style:UIBarButtonItemStylePlain target:self action:@selector(nextPage:)];
    _forwardBtn = [[UIBarButtonItem alloc]initWithTitle:@"forward" style:UIBarButtonItemStylePlain target:self action:@selector(forwardPage:)];
    _forwardBtn.enabled = NO;
    [self.navigationItem setRightBarButtonItems:@[_nextBtn,_forwardBtn]];
}

#pragma mark - 数组赋值
- (void)configArr {
    _arr = @[@"好看的发放的速度adfjdasfjdsl士大夫来得及发;大放送阿斯顿积分;阿娇是打发第三方就;撒地方就",
             @"简直编程阿打算放假了打算将房价的撒;方式登记法律的撒娇发的是浪费;骄傲的手法类似的飞机了;的手机阿里;第三方界的哆啦A梦.3.语法优美,",
             @"按键都发了多少了房间都额外疲弱喷雾我euro;阿斯蒂芬",
             @"的说法扑热我怕人家法律的洒家附近ADSL客服的说法是大家飞拉萨的减肥;阿斯顿飞",
             @"额外若陪我的萨芬激动撒垃圾房价多少范德萨的深V你看许可俄飞机的飞机的历史;飞"];
}
#pragma mark - label
- (void)buildLable {
    _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64)];
    _label.backgroundColor = [UIColor grayColor];
    _label.numberOfLines = 0;
    _label.text = [_arr objectAtIndex:0];
    [self.view addSubview:_label];
}
#pragma mark - 下一页按钮响应事件
- (void)nextPage:(UIButton *)btn {
    _forwardBtn.enabled = YES;
    if (_count<_arr.count-1) {
        btn.enabled = YES;
        _label.text = [_arr objectAtIndex:_count+1];
        NSString *subtypeString;
        subtypeString = kCATransitionFromRight;
        [self transitionWithType:@"pageCurl" WithSubtype:subtypeString ForView:self.view];
        _count = _count + 1;
    } else {
        _count = _arr.count - 1;
        btn.enabled = NO;
        [self showAlert:@"已经是最后一页咯,亲(づ￣ 3￣)づ"];
    }
    NSLog(@"%ld", (long)_count);

}
#pragma mark - 上一页按钮响应事件
- (void)forwardPage:(UIButton *)btn {
    _nextBtn.enabled = YES;
    if (_count>0 ) {
        btn.enabled = YES;
        _label.text = [_arr objectAtIndex:_count-1];
        NSString *subtypeString;
        subtypeString = kCATransitionFromLeft;
        [self transitionWithType:@"pageCurl" WithSubtype:subtypeString ForView:self.view];
        _count = _count - 1;
    } else {
        _count = 0;
        btn.enabled = NO;
        [self showAlert:@"已经是第一页咯,亲(づ￣ 3￣)づ"];
    }
    NSLog(@"%ld", (long)_count);
}

#pragma CATransition动画实现
/**
 *  动画效果实现
 *
 *  @param type    动画的类型 在开头的枚举中有列举,比如 CurlDown//下翻页,CurlUp//上翻页
,FlipFromLeft//左翻转,FlipFromRight//右翻转 等...
 *  @param subtype 动画执行的起始位置,上下左右
 *  @param view    哪个view执行的动画
 */
- (void) transitionWithType:(NSString *) type WithSubtype:(NSString *) subtype ForView : (UIView *) view {
    CATransition *animation = [CATransition animation];
    animation.duration = 0.7f;
    animation.type = type;
    if (subtype != nil) {
        animation.subtype = subtype;
    }
    animation.timingFunction = UIViewAnimationOptionCurveEaseInOut;
    [view.layer addAnimation:animation forKey:@"animation"];
}
#pragma mark - alertView提示
- (void)showAlert:(NSString *)message {
    //<iOS8.0
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:nil cancelButtonTitle:@"知道了,么么哒(づ￣ 3￣)づ" otherButtonTitles: nil];
//    [alert show];
//    return;
    UIAlertController *alertControler = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertControler addAction: [UIAlertAction actionWithTitle: @"取消" style: UIAlertActionStyleCancel handler:nil]];
    [self presentViewController: alertControler animated: YES completion: nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
