//
//  Photos.h
//  JSONPhotosApp
//
//  Created by Sugat Nagavkar on 19/02/18.
//  Copyright © 2018 Sugat Nagavkar. All rights reserved.
//  Data model class

#import <Foundation/Foundation.h>

@interface Photos : NSObject
@property (nonatomic, strong) NSURL *thumbnailURL;
@property (nonatomic, strong) NSURL *url;
+(instancetype) photoDictionary: (NSDictionary *) dictionary;
@end
