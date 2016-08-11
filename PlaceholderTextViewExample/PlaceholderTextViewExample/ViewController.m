//
//  ViewController.m
//  PlaceholderTextViewExample
//
//  Created by 周新刚 on 16/8/11.
//  Copyright © 2016年 zxg. All rights reserved.
//

#import "ViewController.h"
#import "XMGPlaceholderTextView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet XMGPlaceholderTextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.textView.placeholder = @"这是自定义的显示占位文字的textView,可上下拖拽";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
