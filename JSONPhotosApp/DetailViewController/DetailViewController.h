//
//  DetailViewController.h
//  JSONPhotosApp
//
//  Created by Sugat Nagavkar on 19/02/18.
//  Copyright © 2018 Sugat Nagavkar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Photos.h"

@interface DetailViewController : UIViewController
@property (nonatomic, strong) Photos *photo;
@property (nonatomic, strong) UIImageView *imageView;
@end
