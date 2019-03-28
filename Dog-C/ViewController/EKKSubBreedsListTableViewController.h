//
//  EKKSubBreedsListTableViewController.h
//  Dog-C
//
//  Created by Brooke Kumpunen on 3/28/19.
//  Copyright © 2019 Rund LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
@class EKKBreed;

NS_ASSUME_NONNULL_BEGIN

@interface EKKSubBreedsListTableViewController : UITableViewController

//I need a landing pad property here.
@property (nonatomic, strong) EKKBreed *breed;

@end

NS_ASSUME_NONNULL_END
