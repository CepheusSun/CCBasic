//
//  NSArray+CCFunction.h
//  QKios
//
//  Created by sunny on 2017/2/28.
//  Copyright © 2017年 CepheusSun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (CCFunction)

// 遍历数组
- (void)each:(void (^) (id object))block;

// 遍历数组，跟下标相关
- (void)eachWithIndex:(void (^)(id object, NSUInteger index))block;


/**
 // Map
    遍历每个元素，并执行表达式,用返回值存入新的数组中
 @param block 表达式
 @return <#return value description#>
 */
- (NSArray *)map:(id (^)(id object))block;

/**
 // filter 过滤器 将数组中不符合某一条件的元素删除，并返回一个新的数组。
 遍历执行某一表达式.
 @param block 表达式
 */
- (NSArray *)filter:(BOOL (^)(id object))block;

/**
 // detect 查找, 找出数组中符合某一条件的元素
 遍历数组，如果数组中的元素执行表达式返回真,就返回这个元素。找到第一个就返回

 @param block 表达式
 */
- (id)detect:(BOOL (^)(id object))block;


- (id)reduce:(id (^)(id accumlator, id object))block;

- (id)reduce:(id)initial withBlock:(id (^)(id accumulator, id object))block;
@end
