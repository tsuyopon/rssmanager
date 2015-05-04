//
//  NSURLRequest+SSL.m
//  rssmanager
//
//  Created by 大石 剛 on 2015/04/29.
//  Copyright (c) 2015年 Azarashi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURLRequest (SSL)
+ (BOOL)allowsAnyHTTPSCertificateForHost:(NSString*)host;
@end
