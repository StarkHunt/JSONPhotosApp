//
//  PhotosCollectionViewController.m
//  JSONPhotosApp
//
//  Created by Sugat Nagavkar on 20/02/18.
//  Copyright © 2018 Sugat Nagavkar. All rights reserved.
//

#import "PhotosCollectionViewController.h"
#import "PhotoCollectionViewCell.h"
#import "DetailViewController.h"

@interface PhotosCollectionViewController ()

@end

@implementation PhotosCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"JSONPhotoApp"; //set title of the controller
    
    // Register cell classes
    [self.collectionView registerClass:[PhotoCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    // Do any additional setup after loading the view.
    [self downloadData];
}


//MARK: - Number of items in the collection view
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.photos count];
}

//MARK: - Cell for item at indexpath method.
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    //configure cell with PhotoCollectionViewCell custom cell.
    PhotoCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    //configure cells image with photo object
    Photos *photo = [self.photos objectAtIndex:indexPath.row];
    cell.photo = photo;
    
    
    return cell;
    
}

//MARK: - resize item cells
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(150, 150);
}

//MARK: - Did Select Item at IndexPath method.
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    //instantiate DetailViewController
    DetailViewController *detailViewController = [[DetailViewController alloc
                                                   ] init];
    //embed it detailViewController in navigation controller
    UINavigationController *rootViewController = [[UINavigationController alloc] initWithRootViewController:detailViewController];

    //identify and store selected indexpath on did select
    NSIndexPath *selectedIndexPath = [self.collectionView indexPathsForSelectedItems][0];
    //get the corresponding 600X600 image from the model
    Photos *photo = self.photos[selectedIndexPath.row];
    //pass the image to the detail view controller.
    detailViewController.photo = photo;
    
    //present detail view controller.
    [self presentViewController:rootViewController animated:true completion:nil];
    
}

//MARK: - Fetch data from JSON.
-(void) downloadData{
    
    self.photos = [NSMutableArray array]; //array to store json data
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:@"https://jsonplaceholder.typicode.com/photos"];
    
    //fetch data on the background thread asynchronous.
    NSURLSessionDownloadTask *task = [session downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSData *data = [[NSData alloc] initWithContentsOfURL:location];
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        
        //set json dictionary to our Photos data model and add the object to the photo array.
        for (NSDictionary *dict in dictionary){
            Photos *photo = [Photos photoDictionary:dict];
            [self.photos addObject:photo];
        }
        
        //reload collection view cells on the main thread
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionView reloadData];
        });
        
    }];
    [task resume];
}

@end
