//
//  ViewController.m
//  HNKServerFacade-Example
//
//  Created by Harlan Kellaway on 4/13/15.
//  Copyright (c) 2015 Harlan Kellaway. All rights reserved.
//

#import "ViewController.h"

#import <HNKServerFacade/HNKServerFacade.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
  [super viewDidLoad];

  [HNKServer setupWithBaseUrl:@"http://harlankellaway.com/documents/projects"];

  [HNKServer GET:@"test.json"
      parameters:nil
      completion:^(id responseObject, NSError *error) {

        if (error) {
          NSLog(@"HNKServerFacade-Example ERROR: %@", error);
        } else {
          NSLog(@"HNKServerFacade-Example JSON: %@", responseObject);
        }

      }];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
