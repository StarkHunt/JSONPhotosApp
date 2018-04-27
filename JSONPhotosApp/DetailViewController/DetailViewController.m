//
//  DetailViewController.m
//  JSONPhotosApp
//
//  Created by Sugat Nagavkar on 19/02/18.
//  Copyright © 2018 Sugat Nagavkar. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpConstraints];    //set up imageView
    [self getImageforView];     //download image from url
    [self setUpbarButton];      //set up cancel left bar button item.
    
}

//MARK: - Set up Cancel Bar Button Item
-(void) setUpbarButton{
    
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(performCancel)];
    self.navigationItem.leftBarButtonItem = cancelButton;

}

//selector for Cancel Button.
-(void) performCancel{
    [self dismissViewControllerAnimated:true completion:nil];
}

//MARK: - Download images for the url for detail view controller.
-(void) getImageforView{
    if (self.photo){
        
        NSURLRequest *request = [NSURLRequest requestWithURL:self.photo.url cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:60];
        NSURLSession *session = [NSURLSession sharedSession];
        
        //download image data from url on backgroup thread asynchrounous.
        NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            
            NSData *data = [NSData dataWithContentsOfURL:location];
            UIImage *image = [UIImage imageWithData:data];
            
            //display image on the main thread.
            dispatch_async(dispatch_get_main_queue(), ^{
                self.imageView.image = image;
            });
        }];
        [task resume];
        
    }
}

//MARK: - Set up imageView
-(void) setUpConstraints{
    
    self.imageView = [[UIImageView alloc] init];
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.imageView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.imageView];
    
    //constraints
    [self.imageView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = true;
    [self.imageView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = true;
    [self.imageView.widthAnchor constraintEqualToConstant:600];
    [self.imageView.heightAnchor constraintEqualToConstant:600];
    
}

@end
