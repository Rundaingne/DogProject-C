//
//  EKKBreedNetworkClient.m
//  Dog-C
//
//  Created by Brooke Kumpunen on 3/27/19.
//  Copyright © 2019 Rund LLC. All rights reserved.
//

#import "EKKBreedNetworkClient.h"

@implementation EKKBreedNetworkClient

+(NSURL *)baseURL
{
    return [NSURL URLWithString:@"https://dog.ceo/api"];
}

+ (EKKBreedNetworkClient *)shared
{
    static EKKBreedNetworkClient *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[EKKBreedNetworkClient alloc] init];
    });
    return shared;
}


+ (void)fetchAllBreeds:(void (^)(NSArray<EKKBreed *> * _Nonnull))completion
{
    NSURL *url = [[[[EKKBreedNetworkClient baseURL] URLByAppendingPathComponent:@"breeds"] URLByAppendingPathComponent:@"list"] URLByAppendingPathComponent:@"all"];
    //HOLY. CRAP. We got the url, and it took like 7 thousand characters. Anyway.
    //Good gravy. Let's plug this monster into the dataTask.
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, error.localizedDescription);
            completion(@[]);
            return;
        }
        //Error handled. Now let's check if we actually have data and handle THAT error. Dumb.
        if (!data) {
            NSLog(@"We got an error. Yay.");
            completion(@[]);
        }
        //All the dang errors handled. NOW we can do something with our data. So, let's start with the topLevelDictionary.
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        //We have our topLevelDictionary. We need to tap the dictionary below that.
        NSDictionary *messageDictionary = jsonDictionary[@"message"];
        //Alright, now we have all our data.
        
        //We need to return an array of breeds. So...we'd better create an emtpy array to shove things into.
        NSMutableArray *breeds = [NSMutableArray new];
        for (NSString* key in messageDictionary) {
            NSLog(@"key=%@", key);
            for (NSArray<NSString *> *value in messageDictionary) {
                EKKBreed *breed = [[EKKBreed alloc] initWithName:key subBreeds:value imageURLs:[NSMutableArray new]];
                [breeds addObject:breed];
            }
        }
        completion(breeds);
    }] resume];
}

+ (void)fetchImageDataFrom:(NSURL *)imageURL completion:(void (^)(NSData * _Nonnull))completion
{
    
}

+ (void)fetchBreedImageURLsForBreed:(EKKBreed *)breed completion:(void (^)(NSArray<NSString *> * _Nonnull))completion
{
    NSURL *imageURL = [[[[EKKBreedNetworkClient baseURL] URLByAppendingPathComponent:@"breed"] URLByAppendingPathComponent:breed.name] URLByAppendingPathComponent:@"images"];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, error.localizedDescription);
            completion(@[]);
            return;
        }
        if(!data) {
            NSLog(@"We got an error. Yay.");
            completion(@[]);
            return;
        }
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        NSArray *messageArray = jsonDictionary[@"message"];
        completion(messageArray);
    }] resume];
}
     
+ (void)fetchSubBreedImageURLsForSubBreed:(EKKSubBreed *)subBreed breed:(EKKBreed *)breed completion:(void (^)(NSArray<NSString *> * _Nonnull))completion
{
    NSURL *imageURL = [[[[[EKKBreedNetworkClient baseURL] URLByAppendingPathComponent:@"breed"] URLByAppendingPathComponent:breed.name] URLByAppendingPathComponent:subBreed.name] URLByAppendingPathComponent:@"images"];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, error.localizedDescription);
            completion(@[]);
            return;
        }
        if(!data) {
            NSLog(@"We got an error. Yay.");
            completion(@[]);
            return;
        }
        //Now let's actually check the data.
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        //We've got a json dictionary now, so let's create our images from it.
        NSArray *images = jsonDictionary[@"images"];
        completion(images);
    }] resume];
}
     
@end
