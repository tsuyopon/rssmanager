//
//  ViewController.m
//  RssManagerSample
//
//  Created by 大石 剛 on 2015/05/04.
//  Copyright (c) 2015年 Azarashi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    RSSLOG_INFO(@"viewDidLoad start");
    
    [super viewDidLoad];
    RssConfig *cfg = [[RssConfig alloc] init];
    [cfg setLogLevel:LoggerLogTrace];
    
    rssmanager *manager = [rssmanager sharedInstance];
    [manager initWithConfig:cfg];
    
    NSDictionary *params = @{@"url":@"http://rss.dailynews.yahoo.co.jp/fc/rss.xml",
                             @"debug":@"1"};
    
    [manager requestAsync:params
             succeessFunc: ^(NSString *respBody, NSURLResponse *respInfo) {
                 RSSLOG_INFO(@"successHandler start");
                 RSSLOG_TRACE(@"Success Body: %@", respBody);
             }
                errorFunc: ^(NSString *respBody, NSURLResponse *respInfo) {
                    RSSLOG_INFO(@"errorHandler start");
                    NSInteger statusCode = ((NSHTTPURLResponse*)respInfo).statusCode;
                    RSSLOG_TRACE(@"Error: Status:%d Body: %@", statusCode, respBody);
                }
     ];
    
    RSSLOG_INFO(@"viewDidLoad end");
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
