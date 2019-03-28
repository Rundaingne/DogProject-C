//
//  EKKBreedsListTableViewController.m
//  Dog-C
//
//  Created by Brooke Kumpunen on 3/28/19.
//  Copyright © 2019 Rund LLC. All rights reserved.
//

#import "EKKBreedsListTableViewController.h"
#import "EKKBreedNetworkClient.h"
#import "EKKSubBreedsListTableViewController.h"
#import "EKKDogsImagesCollectionViewController.h"

@interface EKKBreedsListTableViewController ()

@property (nonatomic, copy, readwrite) NSArray<EKKBreed *> *breeds;

@end

@implementation EKKBreedsListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [EKKBreedNetworkClient fetchAllBreeds:^(NSArray<EKKBreed *> *breeds) {
        self.breeds = breeds;
        dispatch_async(dispatch_get_main_queue(), ^{
            [[self tableView] reloadData];
        });
    }];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self breeds] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"breedCell" forIndexPath:indexPath];
    EKKBreed *breed = self.breeds[indexPath.row];
    cell.textLabel.text = breed.name;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    EKKBreed *breed = self.breeds [[[[self tableView] indexPathForSelectedRow] row]];
    //If we have subBreeds here, go to the correct controller.
    if (breed.subBreeds.count > 0) {
        [self performSegueWithIdentifier:@"toSubBreeds" sender:self];
    } else {
        [self performSegueWithIdentifier:@"toBreedImages" sender:self];
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    EKKBreed *breed = self.breeds [[[[self tableView] indexPathForSelectedRow] row]];
    if ([[segue identifier] isEqualToString:@"toSubBreeds"]) {
        EKKSubBreedsListTableViewController *destinationVC = [segue destinationViewController];
        destinationVC.breed = breed;
    } else if ([[segue identifier] isEqualToString:@"toBreedImages"]){
        EKKDogsImagesCollectionViewController *destinationVC = [segue destinationViewController];
        destinationVC.breed = breed;
    }
}

@end
