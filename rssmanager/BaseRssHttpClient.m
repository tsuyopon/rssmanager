//
//  BaseRssHttpClient.m
//  rssmanager
//
//  Created by 大石 剛 on 2015/05/04.
//  Copyright (c) 2015年 Azarashi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseRssHttpClient.h"

@implementation BaseRssHttpClient

NSString * const kHTTP_CHECK_METHOD  = @"http";
NSString * const kHTTPS_CHECK_METHOD = @"https";


+ (void)printClass
{
    RSSLOG_WARN(@"You Have To Override This Method");
}

+ (BOOL)getRssRequest:(NSDictionary*)urlInfo returningBody:(NSString**) respBody returningInfo:(NSURLResponse**) respInfo {
    
    [self printClass];
    RSSLOG_INFO(@"BaseRssHttpClient:getRssRequest start");
    RSSLOG_INFO(@"%@", [urlInfo objectForKey:@"url"]);
    NSMutableURLRequest *mReq = [NSMutableURLRequest requestWithURL: [NSURL URLWithString:[urlInfo objectForKey:@"url"]]];
    [mReq setHTTPMethod:@"GET"];
    
    NSError *error;
    NSData *reqData = [NSURLConnection sendSynchronousRequest:mReq returningResponse:&(*respInfo) error:&error];
    *respBody = [[NSString alloc] initWithData:reqData encoding:NSUTF8StringEncoding];
    return YES;
}

@end