//
//  RequestDelegate.h
//  Jaguar_POC
//
//  Created by Abhishek on 16/06/15.
//  Copyright (c) 2015 Tata Motors. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

@interface RequestDelegate : NSObject
{
    AppDelegate *appdelegate;
    int statusCode;
    
    NSString *NSurl;
    
    NSURLConnection *artifactConnection , *authenticationConnection;
    NSMutableData *artifactData , *authenticationData;
    
}

-(void)initiateRequest:(NSURLRequest*)request name:(NSString*)name;
-(void)callArtifactRequest;


@end
