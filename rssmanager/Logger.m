//
//  Logger.m
//  rssmanager
//
//  Created by 大石 剛 on 2015/04/29.
//  Copyright (c) 2015年 Azarashi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Logger.h"

// FIXME: ファイル名称やクラス名称をRssLoggerに変更したい
@implementation Logger

/*
 * デフォルトログレベルはINFOに指定
 */
static LoggerLogLevel kLOG_LEVEL = LoggerLogInfo;

+ (void)setLogLevel:(LoggerLogLevel)level {
    kLOG_LEVEL = level;
}

+ (void)fatal:(NSString*)format, ... {
    va_list args;
    va_start(args, format);
    [self logger:LoggerLogFatal label:@"FATAL" format:format argList:args];
    va_end(args);
}

+ (void)error:(NSString*)format, ... {
    va_list args;
    va_start(args, format);
    [self logger:LoggerLogError label:@"ERROR" format:format argList:args];
    va_end(args);
}

+ (void)warn:(NSString*)format, ... {
    va_list args;
    va_start(args, format);
    [self logger:LoggerLogWarn label:@"WARN" format:format argList:args];
    va_end(args);
}

+ (void)info:(NSString*)format, ... {
    va_list args;
    va_start(args, format);
    [self logger:LoggerLogInfo label:@"INFO" format:format argList:args];
    va_end(args);
}

+ (void)debug:(NSString*)format, ... {
    va_list args;
    va_start(args, format);
    [self logger:LoggerLogDebug label:@"DEBUG" format:format argList:args];
    va_end(args);
}

+ (void)trace:(NSString*)format, ... {
    va_list args;
    va_start(args, format);
    [self logger:LoggerLogTrace label:@"TRACE" format:format argList:args];
    va_end(args);
}


+ (void)logger:(LoggerLogLevel)level label:(NSString *)label format:(NSString *)format argList:(va_list)argList{
    if(kLOG_LEVEL < level){
        return;
    }
    
    NSString* msg;
    if(level == LoggerLogTrace){
        msg = [NSString stringWithFormat:@"[%@] (%s:%d) %@", label, __FUNCTION__, __LINE__, format];
    } else {
        msg = [NSString stringWithFormat:@"[%@] %@", label, format];
    }
    NSLogv(msg, argList);
}

@end