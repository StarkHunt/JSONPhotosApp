//
//  Photos.m
//  JSONPhotosApp
//
//  Created by Sugat Nagavkar on 19/02/18.
//  Copyright © 2018 Sugat Nagavkar. All rights reserved.
//

#import "Photos.h"

@implementation Photos

+(instancetype) photoDictionary: (NSDictionary *) dictionary{
    Photos *photo = [[Photos alloc] init];
    
    //if data exists then it fetches "thumbnailUrl" and corresponding "url".
    if (photo){
        photo.url = [NSURL URLWithString:[dictionary valueForKeyPath:@"url"]];
        photo.thumbnailURL = [NSURL URLWithString:[dictionary valueForKey:@"thumbnailUrl"]];
    }
    
    return photo;
}

@end
