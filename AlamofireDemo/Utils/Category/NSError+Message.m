//
//  NSError+Message.m
//  AlamofireDemo
//
//  Created by czljcb on 2018/2/4.
//  Copyright © 2018年 Jay. All rights reserved.
//

#import "NSError+Message.h"

@implementation NSError (Message)
-(NSString *)localizedFailureReason{
    
    
    
        switch (self.code) {
            case NSURLErrorDownloadDecodingFailedMidStream:
                return @"下载解码失败";
                //return [NSError errorWithDomain:@"NSURLErrorDownloadDecodingFailedMidStream" code:NSURLErrorDownloadDecodingFailedMidStream userInfo:nil];
                break;
            case NSURLErrorBackgroundSessionWasDisconnected:
                return @"后台会话断开连接";
                //return [NSError errorWithDomain:@"NSURLErrorBackgroundSessionWasDisconnected" code:NSURLErrorBackgroundSessionWasDisconnected userInfo:nil];
                break;
            case NSURLErrorBackgroundSessionInUseByAnotherProcess:
                return @"后台会话由另一进程使用";

                //return [NSError errorWithDomain:@"NSURLErrorBackgroundSessionInUseByAnotherProcess" code:NSURLErrorBackgroundSessionInUseByAnotherProcess userInfo:nil];
                break;
                
            case NSURLErrorBackgroundSessionRequiresSharedContainer:
                return @"后台会话需要共享容器";
                //return [NSError errorWithDomain:@"NSURLErrorBackgroundSessionRequiresSharedContainer" code:NSURLErrorBackgroundSessionRequiresSharedContainer userInfo:nil];
                break;
            case NSURLErrorRequestBodyStreamExhausted:
                return @"请求体丢失";

                //return [NSError errorWithDomain:@"NSURLErrorRequestBodyStreamExhausted" code:NSURLErrorRequestBodyStreamExhausted userInfo:nil];
                break;
                
            case NSURLErrorDataNotAllowed:
                return @"数据不允许";
                //return [NSError errorWithDomain:@"NSURLErrorDataNotAllowed" code:NSURLErrorDataNotAllowed userInfo:nil];
                break;
            case NSURLErrorCallIsActive:
                return @"调用活跃";
                //return [NSError errorWithDomain:@"NSURLErrorCallIsActive" code:NSURLErrorCallIsActive userInfo:nil];
                break;
                
            case NSURLErrorInternationalRoamingOff:
                return @"国际漫游关闭";

                //return [NSError errorWithDomain:@"NSURLErrorInternationalRoamingOff" code:NSURLErrorInternationalRoamingOff userInfo:nil];
                break;
            case NSURLErrorDownloadDecodingFailedToComplete:
                return @"下载解码未能完成";

                //return [NSError errorWithDomain:@"NSURLErrorDownloadDecodingFailedToComplete" code:NSURLErrorDownloadDecodingFailedToComplete userInfo:nil];
                break;
                ///
            case NSURLErrorSecureConnectionFailed:
                return @"安全连接失败";

                //return [NSError errorWithDomain:@"NSURLErrorSecureConnectionFailed" code:NSURLErrorSecureConnectionFailed userInfo:nil];
                break;
            case NSURLErrorServerCertificateHasBadDate:
                return @"服务器证书失效";

                //return [NSError errorWithDomain:@"NSURLErrorServerCertificateHasBadDate" code:NSURLErrorServerCertificateHasBadDate userInfo:nil];
                break;
                
            case NSURLErrorCannotCreateFile:
                return @"不能创建文件";

                //return [NSError errorWithDomain:@"NSURLErrorCannotCreateFile" code:NSURLErrorCannotCreateFile userInfo:nil];
                break;
            case NSURLErrorCannotOpenFile:
                return @"不能打开文件";

                //return [NSError errorWithDomain:@"NSURLErrorCannotOpenFile" code:NSURLErrorCannotOpenFile userInfo:nil];
                break;
                
            case NSURLErrorCannotCloseFile:
                return @"不能关闭文件";

                //return [NSError errorWithDomain:@"NSURLErrorCannotCloseFile" code:NSURLErrorCannotCloseFile userInfo:nil];
                break;
            case NSURLErrorCannotWriteToFile:
                return @"不能写文件";

                //return [NSError errorWithDomain:@"NSURLErrorCannotWriteToFile" code:NSURLErrorCannotWriteToFile userInfo:nil];
                break;
            case NSURLErrorCannotRemoveFile:
                return @"不能删文件";

                //return [NSError errorWithDomain:@"NSURLErrorCannotRemoveFile" code:NSURLErrorCannotRemoveFile userInfo:nil];
                break;
            case NSURLErrorCannotMoveFile:
                return @"不能移文件";

                //return [NSError errorWithDomain:@"NSURLErrorCannotMoveFile" code:NSURLErrorCannotMoveFile userInfo:nil];
                break;
                ///
            case NSURLErrorZeroByteResource:
                return @"资源大小为零";
                //return [NSError errorWithDomain:@"NSURLErrorZeroByteResource" code:NSURLErrorZeroByteResource userInfo:nil];
                break;
            case NSURLErrorCannotDecodeRawData:
                return @"无法解码";
                //return [NSError errorWithDomain:@"NSURLErrorCannotDecodeRawData" code:NSURLErrorCannotDecodeRawData userInfo:nil];
                break;
            case NSURLErrorCannotLoadFromNetwork:
                return @"无法加载";
                //return [NSError errorWithDomain:@"NSURLErrorCannotLoadFromNetwork" code:NSURLErrorCannotLoadFromNetwork userInfo:nil];
                break;
            case NSURLErrorClientCertificateRequired:
                return @"要提供客户端证书";
                //return [NSError errorWithDomain:@"NSURLErrorClientCertificateRequired" code:NSURLErrorClientCertificateRequired userInfo:nil];
                break;
            case NSURLErrorClientCertificateRejected:
                return @"客户端证书被拒接";
                //return [NSError errorWithDomain:@"NSURLErrorClientCertificateRejected" code:NSURLErrorClientCertificateRejected userInfo:nil];
                break;
            case NSURLErrorServerCertificateNotYetValid:
                return @"服务器证书尚未生效";
                //return [NSError errorWithDomain:@"NSURLErrorServerCertificateNotYetValid" code:NSURLErrorServerCertificateNotYetValid userInfo:nil];
                break;
            case NSURLErrorServerCertificateHasUnknownRoot:
                return @"服务器证书具有未知根";
                //return [NSError errorWithDomain:@"NSURLErrorServerCertificateHasUnknownRoot" code:NSURLErrorServerCertificateHasUnknownRoot userInfo:nil];
                break;
            case NSURLErrorServerCertificateUntrusted:
                return @"服务器证书不可信";
                //return [NSError errorWithDomain:@"NSURLErrorServerCertificateUntrusted" code:NSURLErrorServerCertificateUntrusted userInfo:nil];
                break;
                ///
            case NSURLErrorFileOutsideSafeArea:
                return @"在安全区域外文件";
                //return [NSError errorWithDomain:@"NSURLErrorFileOutsideSafeArea" code:NSURLErrorFileOutsideSafeArea userInfo:nil];
                break;
            case NSURLErrorDataLengthExceedsMaximum:
                return @"数据长度超过最大值";

                //return [NSError errorWithDomain:@"NSURLErrorDataLengthExceedsMaximum" code:NSURLErrorDataLengthExceedsMaximum userInfo:nil];
                break;
            case NSURLErrorNoPermissionsToReadFile:
                return @"没有权限读取文件";

                //return [NSError errorWithDomain:@"NSURLErrorNoPermissionsToReadFile" code:NSURLErrorNoPermissionsToReadFile userInfo:nil];
                break;
            case NSURLErrorFileIsDirectory:
                return @"文件是目录";

                //return [NSError errorWithDomain:@"NSURLErrorFileIsDirectory" code:NSURLErrorFileIsDirectory userInfo:nil];
                break;
            case NSURLErrorFileDoesNotExist:
                return @"文件不存在";
                //return [NSError errorWithDomain:@"NSURLErrorFileDoesNotExist" code:NSURLErrorFileDoesNotExist userInfo:nil];
                break;
            case NSURLErrorAppTransportSecurityRequiresSecureConnection:
                return @"应用程序传输安全性需要安全连接";

                //return [NSError errorWithDomain:@"NSURLErrorAppTransportSecurityRequiresSecureConnection" code:NSURLErrorAppTransportSecurityRequiresSecureConnection userInfo:nil];
                break;
            case NSURLErrorCannotParseResponse:
                return @"无法解析响应";

                //return [NSError errorWithDomain:@"NSURLErrorCannotParseResponse" code:NSURLErrorCannotParseResponse userInfo:nil];
                break;
            case NSURLErrorCannotDecodeContentData:
                return @"不能解码内容数据";
                //return [NSError errorWithDomain:@"NSURLErrorCannotDecodeContentData" code:NSURLErrorCannotDecodeContentData userInfo:nil];
                break;
                ///
            case NSURLErrorUnknown:
                return @"未知错误";
                //return [NSError errorWithDomain:@"NSURLErrorUnknown" code:NSURLErrorUnknown userInfo:nil];
                break;
            case NSURLErrorCancelled:
                return @"请求取消";
                //return [NSError errorWithDomain:@"NSURLErrorCancelled" code:NSURLErrorCancelled userInfo:nil];
                break;
            case NSURLErrorBadURL:
                return @"URL错误";
                //return [NSError errorWithDomain:@"NSURLErrorBadURL" code:NSURLErrorBadURL userInfo:nil];
                break;
            case NSURLErrorTimedOut:
                return @"请求超时";
                //return [NSError errorWithDomain:@"NSURLErrorTimedOut" code:NSURLErrorTimedOut userInfo:nil];
                break;
            case NSURLErrorUnsupportedURL:
                return @"不支持URL";
                //return [NSError errorWithDomain:@"NSURLErrorUnsupportedURL" code:NSURLErrorUnsupportedURL userInfo:nil];
                break;
            case NSURLErrorCannotFindHost:
                return @"找不到主机";
                //return [NSError errorWithDomain:@"NSURLErrorCannotFindHost" code:NSURLErrorCannotFindHost userInfo:nil];
                break;
            case NSURLErrorCannotConnectToHost:
                return @"连接不到主机";
                //return [NSError errorWithDomain:@"NSURLErrorCannotConnectToHost" code:NSURLErrorCannotConnectToHost userInfo:nil];
                break;
            case NSURLErrorNetworkConnectionLost:
                return @"网络连接丢失";
                //return [NSError errorWithDomain:@"NSURLErrorNetworkConnectionLost" code:NSURLErrorNetworkConnectionLost userInfo:nil];
                break;
                
                ///
            case NSURLErrorDNSLookupFailed:
                return @"DNS查找失败";

                //return [NSError errorWithDomain:@"NSURLErrorDNSLookupFailed" code:NSURLErrorDNSLookupFailed userInfo:nil];
                break;
            case NSURLErrorHTTPTooManyRedirects:
                return @"HTTP太多重定向";
                //return [NSError errorWithDomain:@"NSURLErrorHTTPTooManyRedirects" code:NSURLErrorHTTPTooManyRedirects userInfo:nil];
                break;
            case NSURLErrorResourceUnavailable:
                return @"资源不可用";

                //return [NSError errorWithDomain:@"NSURLErrorResourceUnavailable" code:NSURLErrorResourceUnavailable userInfo:nil];
                break;
            case NSURLErrorNotConnectedToInternet:
                return @"未连接到互联网";
                //return [NSError errorWithDomain:@"NSURLErrorNotConnectedToInternet" code:NSURLErrorNotConnectedToInternet userInfo:nil];
                break;
            case NSURLErrorRedirectToNonExistentLocation:
                return @"重定向到不存在的位置";

                //return [NSError errorWithDomain:@"NSURLErrorRedirectToNonExistentLocation" code:NSURLErrorRedirectToNonExistentLocation userInfo:nil];
                break;
            case NSURLErrorBadServerResponse:
                return @"错误的服务器响应";

                //return [NSError errorWithDomain:@"NSURLErrorBadServerResponse" code:NSURLErrorBadServerResponse userInfo:nil];
                break;
            case NSURLErrorUserCancelledAuthentication:
                return @"用户取消授权";

                //return [NSError errorWithDomain:@"NSURLErrorUserCancelledAuthentication" code:NSURLErrorUserCancelledAuthentication userInfo:nil];
                break;
            case NSURLErrorUserAuthenticationRequired:
                return @"用户授权被拒绝";

                //return [NSError errorWithDomain:@"NSURLErrorUserAuthenticationRequired" code:NSURLErrorUserAuthenticationRequired userInfo:nil];
                break;
            default:
                break;
        }
        
    
    return self.domain;
}
@end
