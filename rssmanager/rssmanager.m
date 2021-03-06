//
//  rssmanager.m
//  rssmanager
//
//  Created by Azarashi on 2015/04/29.
//  Copyright (c) 2015年 Tsuyoshi Ooishi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "rssmanager.h"

@implementation rssmanager

// シングルトンモデル
static rssmanager* sharedInstance = nil;
RssConfig* sharedConfig;

/*
 * インスタンスを初期化した際に呼び出されます。
 */
+ (rssmanager*)sharedInstance
{
    RSSLOG_INFO(@"sharedInstance start");
    static dispatch_once_t once;
    dispatch_once( &once, ^{
        RSSLOG_INFO(@"sharedInstance: dispatch_once start");
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

/*
 * インスタンス初期化後に設定を与えるメソッドです。
 */
- (BOOL)initWithConfig:(RssConfig *)config
{
    RSSLOG_INFO(@"initWithConfig start");
    sharedConfig = config;
    [self setLogLevel:sharedConfig.logLevel];
    return YES;
}

/*
 * このライブラリのログレベルを変更します。
 */
- (void)setLogLevel:(LoggerLogLevel)level
{
    RSSLOG_DEBUG(@"setLogLevel start");
    sharedConfig.logLevel = level;
    SET_LOG_LEVEL(level);
}

- (void)requestAsync:(NSDictionary *)urlInfo
        succeessFunc:(void (^)(NSString *respBody, NSURLResponse *respInfo)) successHandler
           errorFunc:(void (^)(NSString *respBody, NSURLResponse *respInfo)) errorHandler;
{
    RSSLOG_INFO(@"requestAsync start");
    
    // FIXME: urlInfoのチェックを行うこと
    // TODO: http, httpsの判定などを行うこと
    // TODO: 日本語はURLエンコーディングすることを明記しておくこと
    // TODO: domainとパラメータを分離するか検討すること
    // TODO: XMLライブラリを追加すること
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        RSSLOG_INFO(@"requestAsycn dispatch_async start");
        RSSLOG_INFO(@"xxxxx:%@", [urlInfo objectForKey:@"url"]);
        
        NSString *respBody;
        NSURLResponse *respInfo;

        // TODO: クラスのチェックしかしていないので、もっとやってもいいかもしれない
        id getObj = NSClassFromString([urlInfo objectForKey:@"client"]);
        if(getObj){
            // 指定されたkeyのオブジェクトが存在する場合
            RSSLOG_INFO(@"client key's object is exists.");
            [getObj getRssRequest:urlInfo returningBody:&respBody returningInfo:&respInfo];
        } else {
            // 指定されたkeyのオブジェクトが存在しない合
            RSSLOG_INFO(@"client key is not set or client key's object does not exist.");
            [YahootopicsRssHttpClient getRssRequest:urlInfo returningBody:&respBody returningInfo:&respInfo];
        }
        NSInteger statusCode = ((NSHTTPURLResponse*)respInfo).statusCode;
        
        // TODO:成功ステータスはリクエスト側に決定させたい。指定がなければ200とする。
        RSSLOG_INFO(@"code %d", statusCode);
        if(statusCode == 200){
            RSSLOG_INFO(@"requestAsync request successed");
            successHandler(respBody, respInfo);
        } else {
            RSSLOG_INFO(@"requestAsync request failed");
            errorHandler(respBody, respInfo);
        }
    });
}

@end
