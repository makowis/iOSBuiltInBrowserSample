//
//  WebBrowserViewController.h
//
//  Created by 誠 逸見 on 12/01/18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebBrowserViewController : UIViewController <UIWebViewDelegate>

@property(nonatomic,retain)IBOutlet UIWebView *webView;
@property(nonatomic,retain)NSURL *url_;
@property(nonatomic,retain)IBOutlet UIToolbar *backBar;
@property(nonatomic,retain)IBOutlet UIBarButtonItem *backBtn;
@property(nonatomic,retain)IBOutlet UIBarButtonItem *goBtn;

-(IBAction)closeBtn:(id)sender;
-(IBAction)reloadUrl:(id)sender;
-(IBAction)back:(id)sender;
-(IBAction)forward:(id)sender;
-(IBAction)openSafari:(id)sender;

@end
