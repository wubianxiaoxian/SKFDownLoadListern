#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "NSString+SKFDownLoader.h"
#import "SKFDownLoader.h"
#import "SKFDownLoaderFileTool.h"
#import "SKFDownLoadManager.h"

FOUNDATION_EXPORT double SKFDownLoadLibVersionNumber;
FOUNDATION_EXPORT const unsigned char SKFDownLoadLibVersionString[];

