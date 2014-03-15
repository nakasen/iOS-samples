//
//  WebViewController.m
//  TwitterClientSample02
//
//  Created by 中川 聡 on 2013/05/20.
//  Copyright (c) 2013年 nakasen.com. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSURLRequest *myRequest = [NSURLRequest requestWithURL:self.openURL];
    [self.webView loadRequest:myRequest];
}
/*
- (void)webViewDidStartLoad:(UIWebView *)webView {
    [self.activityIndicator startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView*)webView {
    [self.activityIndicator stopAnimating];
}

- (void)webView:(UIWebView*)webView
didFailLoadWithError:(NSError*)error {
    [self.activityIndicator stopAnimating];
}
*/
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
