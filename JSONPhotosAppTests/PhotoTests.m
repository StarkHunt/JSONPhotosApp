//
//  PhotoTests.m
//  JSONPhotosAppTests
//
//  Created by Sugat Nagavkar on 27/04/18.
//  Copyright © 2018 Sugat Nagavkar. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PhotosCollectionViewController.h"
#import "PhotoCollectionViewCell.h"
@interface PhotoTests : XCTestCase
@property (nonatomic) PhotosCollectionViewController *photoCollectionViewController;
@property (nonatomic) PhotoCollectionViewCell *photoCollectionViewCell;

@end

@implementation PhotoTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.photoCollectionViewController = [[PhotosCollectionViewController alloc] init];
    self.photoCollectionViewCell = [[PhotoCollectionViewCell alloc] init];
    
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    self.photoCollectionViewController = nil;
    self.photoCollectionViewCell = nil;
}


- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}


-(void)testPhotosController{
    [self.photoCollectionViewController downloadData];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://placehold.it/150/92c952"];
    [self.photoCollectionViewCell downloadImageWithURL:url];
    
}




@end
