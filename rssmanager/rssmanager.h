//
//  rssmanager.h
//  rssmanager
//
//  Created by 大石 剛 on 2015/04/29.
//  Copyright (c) 2015年 Tsuyoshi Ooishi. All rights reserved.
//

#import "RssConfig.h"
#import "Logger.h"
#import "BaseRssHttpClient.h"
#import "YahootopicsRssHttpClient.h"

@interface rssmanager : NSObject

@property BaseRssHttpClient *rssClient;

+ (rssmanager*)sharedInstance;
- (BOOL)initWithConfig:(RssConfig*)config;
- (void)requestAsync:(NSDictionary *)urlInfo
        succeessFunc:(void (^)(NSString *respBody, NSURLResponse *respInfo)) successHandler
           errorFunc:(void (^)(NSString *respBody, NSURLResponse *respInfo)) errorHandler;
@end
