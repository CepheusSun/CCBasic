//
//  UIImage+CCBlock.h
//  QKios
//
//  Created by sunny on 2017/2/28.
//  Copyright © 2017年 CepheusSun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface UIImage (CCBlock)

UIKIT_EXTERN void imageWriteToSavedPhotosAlbum(UIImage *image, void(^completetionBlock)(NSError *));

UIKIT_EXTERN void saveVideoAtURLToSavedPhotosAlbum(NSURL *videoURL, void(^completetionBlock)(NSError *));
@end

NS_ASSUME_NONNULL_END
