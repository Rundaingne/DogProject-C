//
//  EKKSubBreedsListTableViewController.m
//  Dog-C
//
//  Created by Brooke Kumpunen on 3/28/19.
//  Copyright © 2019 Rund LLC. All rights reserved.
//

#import "EKKSubBreedsListTableViewController.h"
#import "EKKBreedNetworkClient.h"
#import "EKKDogsImagesCollectionViewController.h"


@interface EKKSubBreedsListTableViewController ()

@end

@implementation EKKSubBreedsListTableViewController

//Landing pad:

-(void)setBreed:(EKKBreed *)breed
{
    if(breed != _breed) {
        self.breed = _breed;
        [[self tableView] reloadData];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [[[self breed] name] capitalizedString];
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[self breed] subBreeds] count];;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"subBreedCell" forIndexPath:indexPath];
    cell.textLabel.text = [[[self breed] subBreeds][indexPath.row] capitalizedString];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"fromSubBreedsToImages" sender:self];
}

//Ohhhhhhhh. In order for the segue to run in objective C, we have to have this function. If we don't, if won't run.

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    EKKSubBreed *subBreed = self.breed.subBreeds [[[[self tableView] indexPathForSelectedRow] row]];
    if ([[segue identifier] isEqualToString:@"fromSubBreedToImages"]) {
        EKKDogsImagesCollectionViewController *destinationVC = [segue destinationViewController];
        destinationVC.breed = self.breed;
        destinationVC.subBreed = subBreed;
    }
}

@end
