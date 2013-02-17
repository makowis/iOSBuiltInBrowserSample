//
//  BBViewController.m
//  iOSBuiltInBrowserSample
//
//  Created by 逸見 誠 on 2013/02/17.
//  Copyright (c) 2013年 逸見 誠. All rights reserved.
//

#import "BBViewController.h"
#import "WebBrowserViewController.h"

@interface BBViewController ()

@end

@implementation BBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 画面遷移時のイベント（値の受け渡し）
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    // サイトで見るを押された場合
    if ([[segue identifier] isEqualToString:@"ViewWeb"]) {
        WebBrowserViewController *viewController = (WebBrowserViewController*)[segue destinationViewController];
        // テキストフィールドに入力された文字をURLに変換して渡す
        viewController.url_ = [NSURL URLWithString:_urlTextField.text];
    }
}

@end
