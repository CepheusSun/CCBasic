//
//  ViewController.m
//  QKios
//
//  Created by sunny on 2017/2/28.
//  Copyright © 2017年 CepheusSun. All rights reserved.
//

#import "ViewController.h"
#import "NSArray+CCFunction.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *arr = @[@"1",@"2",@"3"];
    [arr each:^(id object) {
        
    }];
    
//    id de = [arr detect:^BOOL(id object) {
//        return [object isEqualToString:@"1"];
//    }];
//    
//    NSLog(@"%@",de);
//
    
    id reduc = [arr reduce:^id(id accumlator, id object) {
        NSLog(@"%@---%@",accumlator,object);
        
        return @"1";
    }];
    
    NSLog(@"%@",reduc);
    
    
//    NSArray *arr2 = [arr map:^id(id object) {
//        return [NSString stringWithFormat:@"%@%@",object,object];
//    }];
//    
//    NSLog(@"====%@",arr2);
//    
//    
//    NSArray *array3 = [arr2 filter:^BOOL(id object) {
//        return ![object isEqualToString:@"11"];
//    }];
//    
//    NSLog(@"==%@",array3);
//    
//    
//    NSArray *array4 = [array3 reject:^BOOL(id object) {
//        return [object isEqualToString:@"22"];
//    }];
//    
//    NSLog(@"%@",array4);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
