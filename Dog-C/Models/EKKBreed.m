//
//  EKKBreed.m
//  Dog-C
//
//  Created by Brooke Kumpunen on 3/27/19.
//  Copyright © 2019 Rund LLC. All rights reserved.
//

#import "EKKBreed.h"

@implementation EKKBreed

- (instancetype)initWithName:(NSString *)name subBreeds:(NSArray *)subBreeds imageURLs:(NSArray<NSString *> *)imageURLs
{
    self = [super init];
    if(self) {
        _name = name;
        _subBreeds = subBreeds;
        _imageURLs = imageURLs;
    }
    return self;
}

@end
