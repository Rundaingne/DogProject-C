//
//  EKKSubBreed.m
//  Dog-C
//
//  Created by Brooke Kumpunen on 3/27/19.
//  Copyright © 2019 Rund LLC. All rights reserved.
//

#import "EKKSubBreed.h"

@implementation EKKSubBreed

- (instancetype)initWithName:(NSString *)name imageURLs:(NSArray<NSString *> *)imageURLs
{
    self = [super init];
    if(self) {
        _name = name;
        _imageURLs = imageURLs;
    }
    return self;
}

@end
