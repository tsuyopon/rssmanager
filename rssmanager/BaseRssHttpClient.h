//
//  BaseRssHttpClient.h
//  rssmanager
//
//  Created by 大石 剛 on 2015/05/04.
//  Copyright (c) 2015年 Azarashi. All rights reserved.
//

#ifndef rssmanager_BaseRssHttpClient_h
#define rssmanager_BaseRssHttpClient_h

#import "Logger.h"

/**
 * RSSにHTTPリクエストするための基底クラスです。**このクラスは継承として利用し、直接呼び出さないようにしてください。
 */
@interface BaseRssHttpClient : NSObject

/**
 * クラスに関する情報を表示します。
 * @return void
 */
+ (void)printClass;

/**
 * RSS
 * @return リクエストが成功したかどうかを返却します。
 */
+ (BOOL)getRssRequest:(NSDictionary*)urlInfo returningBody:(NSString**) respBody returningInfo:(NSURLResponse**) respInfo;

@property NSString * const requestUrl;
@property NSDictionary * const requestParameters;

// external header information
extern NSString *const kHTTP_CHECK_METHOD;
extern NSString *const kHTTPS_CHECK_METHOD;

@end


#endif
