//
//  EKKDogsImagesCollectionViewController.h
//  Dog-C
//
//  Created by Brooke Kumpunen on 3/28/19.
//  Copyright © 2019 Rund LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
@class EKKBreed;
@class EKKSubBreed;

NS_ASSUME_NONNULL_BEGIN

@interface EKKDogsImagesCollectionViewController : UICollectionViewController

@property (nonatomic, strong) EKKBreed *breed;
@property (nonatomic, strong) EKKSubBreed *subBreed;

@end

NS_ASSUME_NONNULL_END
