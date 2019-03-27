//
//  EKKBreed.h
//  Dog-C
//
//  Created by Brooke Kumpunen on 3/27/19.
//  Copyright © 2019 Rund LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface EKKBreed : NSObject

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSArray<EKKBreed *> *subBreeds;
@property (nonatomic, readonly) NSArray<NSString *> *imageURLs;

-(instancetype)initWithName:(NSString *)name subBreeds:(NSArray<EKKBreed *> *)subBreeds imageURLs:(NSArray<NSString *> *)imageURLs;

@end

NS_ASSUME_NONNULL_END
