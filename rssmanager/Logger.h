//
//  Logger.h
//  rssmanager
//
//  Created by 大石 剛 on 2015/04/29.
//  Copyright (c) 2015年 Azarashi. All rights reserved.
//

#ifndef rssmanager_Logger_h
#define rssmanager_Logger_h

#import "RssConfig.h"

#ifdef DEBUG

// MEMO: LOG_DEBUGやLOG_INFOだとsyslog.hの定義とduplicateするので別名を付与することにした。

// for DEBUG SCHEME ONLY
#define SET_LOG_LEVEL(level) [Logger setLogLevel:level]
#define RSSLOG_FATAL(...)    [Logger fatal:__VA_ARGS__]
#define RSSLOG_ERROR(...)    [Logger error:__VA_ARGS__]
#define RSSLOG_WARN(...)     [Logger warn:__VA_ARGS__]
#define RSSLOG_INFO(...)     [Logger info:__VA_ARGS__]
#define RSSLOG_DEBUG(...)    [Logger debug:__VA_ARGS__]
#define RSSLOG_TRACE(...)    [Logger trace:__VA_ARGS__]
#else

// for RELEASE SCHEME
#define SET_LOG_LEVEL(level)
#define RSSLOG_FATAL(...)
#define RSSLOG_ERROR(...)
#define RSSLOG_WARN(...)
#define RSSLOG_INFO(...)
#define RSSLOG_DEBUG(...)
#define RSSLOG_TRACE(...)

#endif // DEBUG

@interface Logger : NSObject

/**
 * ログレベルを設定する
 * @param level 設定したいログレベルを指定する
 */
+ (void)setLogLevel:(LoggerLogLevel)level;

/**
 * FATALログを出力
 * @param format 書式
 * @param ... 展開文字列
 */
+ (void)fatal:(NSString*)format, ...;
+ (void)error:(NSString*)format, ...;
+ (void)warn: (NSString*)format, ...;
+ (void)info: (NSString*)format, ...;
+ (void)debug:(NSString*)format, ...;
+ (void)trace:(NSString*)format, ...;

/**
 * ログを出力するためのコアメソッド
 * @param level ログレベル
 * @param label ログレベルとして指定されたレベル表記
 * @param format 書式文字
 * @param argList formatに展開
 */
+ (void)logger:(LoggerLogLevel)level label:(NSString *)label format:(NSString*)format argList:(va_list)argList;

@end


#endif // rssmanager_Logger_h