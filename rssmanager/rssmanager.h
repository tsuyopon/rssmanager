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

/**
 * Rss Manager管理クラスオブジェクト(Singleton)
 *
 * このライブラリはこの管理クラスを通して利用します。本ライブラリでは以下の機能を提供します。
 *
 * - デバッグ機能
 * - RSSへの透過的なアクセス
 */
@interface rssmanager : NSObject

/**
 * 初期化を行うメソッド
 * @return rssmanagerのオブジェクト(シングルトンを保証)
 */
+ (rssmanager*)sharedInstance;

/**
 * 初期化後に設定オブジェクトを渡すメソッド
 * @param config RssConfigオブジェクト
 * @return 成否を表す
 */
- (BOOL)initWithConfig:(RssConfig*)config;

/**
 * RSS情報を非同期で取得するメソッド
 * @bug urlInfoにはurlキーを渡さないと正常に動作しません
 * @param succeFunc 取得成功時に呼び出されるハンドラ
 * @param errorFunc 取得失敗時に呼び出されるハンドラ
 * @return void
 */
- (void)requestAsync:(NSDictionary *)urlInfo
        succeessFunc:(void (^)(NSString *respBody, NSURLResponse *respInfo)) successHandler
           errorFunc:(void (^)(NSString *respBody, NSURLResponse *respInfo)) errorHandler;

@end
