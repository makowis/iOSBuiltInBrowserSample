//
//  WebBrowserViewController.m
//
//  Created by 誠 逸見 on 12/01/18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "WebBrowserViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation WebBrowserViewController

@synthesize webView;
@synthesize url_;
@synthesize backBar;
@synthesize backBtn;
@synthesize goBtn;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationController.navigationBarHidden = YES;

    // 戻るボタンを作成（左三角がないので反転）
    backBar.transform = CGAffineTransformMakeScale(-1,1);
    //戻ると進むを非活性
    backBtn.enabled = NO;
    goBtn.enabled = NO;

    // インジケーターの表示
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    // URLの読み込み
    [webView loadRequest:[NSURLRequest requestWithURL:url_]];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

/******************************/
// WebViewイベント関数
/******************************/
// ページの読み込み終了
-(void)webViewDidFinishLoad:(UIWebView*)webView_ {
    // インジケーターの非表示
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    // ボタンの活性・非活性を切り替え
    backBtn.enabled = webView_.canGoBack;
    goBtn.enabled = webView_.canGoForward;
}

/******************************/
// 自作イベント関数
/******************************/
// 閉じるボタンを押す。
-(IBAction)closeBtn:(id)sender {
    self.navigationController.navigationBarHidden = NO;

    // インジケーターの非表示
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    // webViewのデリゲート解放
    webView.delegate = nil;
    
    // 現在のViewを閉じる
    [self dismissViewControllerAnimated:YES completion:nil];
}

// ページの再読み込み
-(IBAction)reloadUrl:(id)sender {
    // インジケーターの表示
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [webView reload];
}

// 戻るボタン
-(IBAction)back:(id)sender{
    [webView goBack];
}

// 進むボタン
-(IBAction)forward:(id)sender {
    [webView goForward];
}

// サファリで開く
-(IBAction)openSafari:(id)sender {
    // 現在のURLを取得
    NSString* url = [webView stringByEvaluatingJavaScriptFromString:@"document.URL"];
    // サファリでオープン
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}

@end
