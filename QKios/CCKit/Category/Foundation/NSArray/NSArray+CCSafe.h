//
//  NSArray+CCSafe.h
//  QKios
//
//  Created by sunny on 2017/2/28.
//  Copyright © 2017年 CepheusSun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSArray (CCSafe)

- (id)safe_objectAtIndex:(NSUInteger)index;

@end


@interface NSMutableArray (CCSafe)

- (void)addObj:(id)obj;

@end
