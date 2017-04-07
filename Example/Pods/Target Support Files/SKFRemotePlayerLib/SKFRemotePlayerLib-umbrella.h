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

#import "NSURL+SKFAudio.h"
#import "SKFAudioDownLoader.h"
#import "SKFAudioFileTool.h"
#import "SKFRemotePlayer.h"
#import "SKFResourceLoader.h"

FOUNDATION_EXPORT double SKFRemotePlayerLibVersionNumber;
FOUNDATION_EXPORT const unsigned char SKFRemotePlayerLibVersionString[];

