//
//  ViewController.m
//  ParseDemo
//
//  Created by Yung Dai on 2015-05-11.
//  Copyright (c) 2015 Yung Dai. All rights reserved.
//

#import "ViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [Parse setApplicationId:@"7VKyoDCYua9wdMGr4FJb56AK8SaUrnmvrpl6dkoS"
                  clientKey:@"omHaVBfXXThF34FPCemxwq0atvkX1qvFiAYcoebu"];
    
    
    // adding NSUser Defaults to the app
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@"Yung" forKey:@"firstName"];
    [defaults setObject:@"Dai" forKey:@"lastName"];
    
    // this is how you save the NSUser Defaults data
    [defaults synchronize];
    
    [self returnData];
    
    // Facebook SDK login
    
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    loginButton.center = self.view.center;
    [self.view addSubview:loginButton];
    
    
    
    
    // lecture for learninga about the image file saving to Parse
    
    Course *courseObject = [[Course alloc]init];
    
    
    // sending the image to Prase
    UIImage *imageObject = [UIImage imageNamed:@"friendship-day-gifts-ideas-20121"];
    // convert this image to data object
    NSData *imageData = UIImagePNGRepresentation(imageObject);
    
    
    
    PFFile *imageFile = [PFFile fileWithName:@"friendship-day-gifts-ideas-20121" data:imageData];
    courseObject = [Course objectWithoutDataWithObjectId:courseObject.objectId];
    
    [courseObject setObject:@"Yung Dai" forKey:@"name"];
    [courseObject setObject:imageFile forKey:@"image"];
    
    
    // save in the backgound asynchronously
    [courseObject saveInBackground];
    
    // fetch the data from parse
    PFFile *fetchData = [courseObject objectForKey:@"image"];
    NSData *returnedData = [fetchData getData];
    
    UIImage *image = [UIImage imageWithData:returnedData];
    
    // print out the data object
//    NSLog(@"%@", image);
//    NSLog(@"%@", returnedData);
    
    _myImage.image = image;
    
}

// call this method to return the data that I saved in NSUserDefaults
- (void) returnData {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *firstName = [defaults objectForKey:@"firstName"];
    NSString *lastName = [defaults objectForKey:@"lastName"];
    
    NSLog(@"%@ %@", firstName, lastName);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
