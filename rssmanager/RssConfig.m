//
//  RssConfig.m
//  rssmanager
//
//  Created by Azarashi on 2015/04/29.
//  Copyright (c) 2015年 Azarashi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RssConfig.h"

/// NSCopying
/// http://www15.plala.or.jp/NovemberKou/programming/2ndGeneration/2ndHome/MasterMotif/NSCopyingForMasterMotif.html

@implementation RssConfig : NSObject

- (id)init
{
    if(self = [super init]){
        // FIXME: 設定値は最後に漏れがないかみなおしておく
        self.logLevel = LoggerLogInfo;
    }
    return self;
}

- (id)copyWithZone:(NSZone*)zone
{
    RssConfig *config = [[[self class] allocWithZone:zone] init];
    
    // FIXME: 設定値は最後に漏れがないかみなおしておく
    [config setLogLevel:self.logLevel];
    return config;
}

@end
