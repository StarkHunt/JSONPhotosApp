//
//  PhotoCollectionViewCell.h
//  JSONPhotosApp
//
//  Created by Sugat Nagavkar on 19/02/18.
//  Copyright © 2018 Sugat Nagavkar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Photos.h"

@interface PhotoCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) Photos *photo;
-(void) downloadImageWithURL: (NSURL *) url;
@end
