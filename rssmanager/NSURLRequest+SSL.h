//
//  NSURLRequest+SSL.h
//  rssmanager
//
//  Created by 大石 剛 on 2015/04/29.
//  Copyright (c) 2015年 Azarashi. All rights reserved.
//

// Xcodeから"Product" -> "Scheme" -> "Edit Scheme"をしてBuild ConfigurationをDEBUGにする必要あり
#ifdef DEBUG

#ifndef rssmanager_NSURLRequest_SSL_h
#define rssmanager_NSURLRequest_SSL_h

#import "NSURLRequest+SSL.h"

/**
 * オレオレ証明書を許可する
 * @warning *Important:*　このメソッドは**DEBUGビルド**のみ含まれるようになっています。
 *          ***(AppleStore時に弾かれる可能性があるからです)***
 * @param succeFunc 取得成功時に呼び出されるハンドラ
 * @param errorFunc 取得失敗時に呼び出されるハンドラ
 * @return void
 */
@implementation NSURLRequest(SSL)
+ (BOOL)allowsAnyHTTPSCertificateForHost:(NSString *)host {
    return YES;
}
@end

#endif

#endif // #ifdef DEBUG
