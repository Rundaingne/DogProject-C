//
//  EKKSubBreed.h
//  Dog-C
//
//  Created by Brooke Kumpunen on 3/27/19.
//  Copyright © 2019 Rund LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface EKKSubBreed : NSObject

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSArray<NSString *> *imageURLs;

-(instancetype)initWithName:(NSString *)name imageURLs:(NSArray<NSString *> *)imageURLs;

@end

NS_ASSUME_NONNULL_END
