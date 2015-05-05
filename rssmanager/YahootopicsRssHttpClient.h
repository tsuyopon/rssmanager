//
//  YahootopicsRssHttpClient.h
//  rssmanager
//
//  Created by 大石 剛 on 2015/05/04.
//  Copyright (c) 2015年 Azarashi. All rights reserved.
//

#ifndef rssmanager_YahootopicsRssHttpClient_h
#define rssmanager_YahootopicsRssHttpClient_h

#import "BaseRssHttpClient.h"

/**
 * Yahoo Topicsを取得するためのクラスです。BaseRssHttpClientを継承しています。
 */
@interface YahootopicsRssHttpClient : BaseRssHttpClient

/**
 * クラスに関する情報を表示します。*親クラスのメソッドをオーバーライドしています*
 * @return void
 */
+ (void)printClass;

@end

#endif
