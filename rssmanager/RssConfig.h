//
//  RssConfig.h
//  rssmanager
//
//  Created by 大石 剛 on 2015/04/29.
//  Copyright (c) 2015年 Azarashi. All rights reserved.
//

#ifndef rssmanager_RssConfig_h
#define rssmanager_RssConfig_h

/**
 * RSSリクエストに関する設定情報を管理するクラス
 */
@interface RssConfig : NSObject <NSCopying>

/**
 * 出力ログレベル
 */
typedef NS_ENUM(NSInteger, LoggerLogLevel){
    LoggerLogFatal = 1,
    LoggerLogError,
    LoggerLogWarn,
    LoggerLogInfo,
    LoggerLogDebug,
    LoggerLogTrace
};

/**
 * ログレベル設定
 */
@property LoggerLogLevel logLevel;

@end

#endif
