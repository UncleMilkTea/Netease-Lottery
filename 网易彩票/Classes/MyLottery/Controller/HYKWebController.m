//
//  HYKWebController.m
//  网易彩票
//
//  Created by 侯玉昆 on 16/1/21.
//  Copyright © 2016年 侯玉昆. All rights reserved.
//

#import "HYKWebController.h"
#import "HYKHelp.h"

@interface HYKWebController ()<UIWebViewDelegate>

@end

@implementation HYKWebController

- (void)loadView {

    self.view = [[UIWebView alloc]initWithFrame:[UIScreen mainScreen].bounds];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title  = _selectHelp.title;
    
    UIWebView *webView = (UIWebView *)self.view;
    
    webView.delegate = self;
    
    NSString *path = [[NSBundle mainBundle] pathForResource:_selectHelp.html ofType:nil];
    
    NSURL *url = [NSURL fileURLWithPath: path];

    NSURLRequest *request  = [NSURLRequest requestWithURL:url];
    
    [webView loadRequest:request];
    
    
}


//! 跳转到指定位置
- (void)webViewDidFinishLoad:(UIWebView *)webView {

    [webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"window.location.href='#%@'",_selectHelp.ID]];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
