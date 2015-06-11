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

  HNKServer *developmentServer = [[HNKServer alloc] initWithBaseURL:@"http://harlankellaway.com/documents/projects"];
    
  NSLog(@"Initial response content types: %@", developmentServer.responseContentTypes);

  [developmentServer
      configureResponseContentTypes:[NSSet setWithObjects:@"application/json", @"text/html", nil]];

  NSLog(@"Content types after override: %@", developmentServer.responseContentTypes);

  [developmentServer GET:@"test.json"
      parameters:nil
      completion:^(id responseObject, NSError *error) {

        if (error) {
          NSLog(@"HNKServerFacade-Example ERROR: %@", error);
        } else {
          NSLog(@"HNKServerFacade-Example JSON: %@", responseObject);
        }

      }];
    
    HNKServer *invalidServer = nil;
    
    @try {
        invalidServer = [[HNKServer alloc] init];
    }
    @catch (NSException *exception) {
        NSLog(@"%@", exception);
    }
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
