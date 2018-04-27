//
//  PhotosCollectionViewController.h
//  JSONPhotosApp
//
//  Created by Sugat Nagavkar on 20/02/18.
//  Copyright © 2018 Sugat Nagavkar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotosCollectionViewController : UICollectionViewController
@property (nonatomic, strong) NSMutableArray *photos;
-(void) downloadData;
@end
