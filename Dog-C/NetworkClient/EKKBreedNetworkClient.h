//
//  EKKBreedNetworkClient.h
//  Dog-C
//
//  Created by Brooke Kumpunen on 3/27/19.
//  Copyright © 2019 Rund LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EKKBreed.h"
#import "EKKSubBreed.h"

NS_ASSUME_NONNULL_BEGIN

@interface EKKBreedNetworkClient : NSObject

+(void)fetchAllBreeds:(void (^)(NSArray<EKKBreed *> *))completion;

+(void)fetchBreedImageURLsForBreed:(EKKBreed *)breed completion:(void (^)(NSArray<NSString *> *imageURLs))completion;

+(void)fetchSubBreedImageURLsForSubBreed:(EKKSubBreed *)subBreed breed:(EKKBreed *)breed completion:(void (^)(NSArray<NSString *> *imageURLs))completion;

+(void)fetchImageDataFrom:(NSURL *)imageURL completion:(void (^)(NSData *imageData))completion;

+ (EKKBreedNetworkClient *)shared;

@end

NS_ASSUME_NONNULL_END
