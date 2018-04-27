//
//  PhotoCollectionViewCell.m
//  JSONPhotosApp
//
//  Created by Sugat Nagavkar on 19/02/18.
//  Copyright © 2018 Sugat Nagavkar. All rights reserved.
//

#import "PhotoCollectionViewCell.h"

@implementation PhotoCollectionViewCell

-(void) setPhoto:(Photos *)photo{
    _photo = photo;
    
    [self downloadImageWithURL: photo.thumbnailURL];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self buildViews];
        
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self buildViews];
    }
    return self;
}

-(void) buildViews{
    [self setUpImageViews]; //set up imageView for the collectionView cell.
}

-(void) setUpImageViews{
    
    self.imageView = [[UIImageView alloc] init];
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addSubview:self.imageView];
    
    
    //constraints
    [self.imageView.topAnchor constraintEqualToAnchor:self.topAnchor].active = true;
    [self.imageView.leftAnchor constraintEqualToAnchor:self.leftAnchor].active = true;
    [self.imageView.rightAnchor constraintEqualToAnchor:self.rightAnchor].active = true;
    [self.imageView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = true;
    
}

//MARK: -Download data with specific url.
-(void) downloadImageWithURL: (NSURL *) url{
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:60];
    
    //download image on the bacground thread asynchrounous.
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSData *data = [NSData dataWithContentsOfURL:location];
        UIImage *image = [UIImage imageWithData:data];
        
        //display thumbnail image on main thread.
        dispatch_async(dispatch_get_main_queue(), ^{
                self.imageView.image = image;
        });
    }];
    [task resume];
}
@end
