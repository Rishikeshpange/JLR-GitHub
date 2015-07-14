//
//  RequestDelegate.m
//  Jaguar_POC
//
//  Created by Abhishek on 16/06/15.
//  Copyright (c) 2015 Tata Motors. All rights reserved.
//

#import "RequestDelegate.h"

@implementation RequestDelegate


-(void)initiateRequest:(NSURLRequest *)request name:(NSString *)name
{
    if([name isEqualToString:@"artifactRequest"]) // for artifactrequest
    {
         NSLog(@"SENDING ARTIFACT REQUEST");
        
        artifactData = [[NSMutableData alloc]init];
        artifactConnection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [artifactConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [artifactConnection start];
        NSLog(@"Ending..");
    }
    
    if([name isEqualToString:@"authenticationRequest"]) // for Authentication
    {
        NSLog(@"SENDING ARTIFACT REQUEST");
        
        authenticationData = [[NSMutableData alloc]init];
        authenticationConnection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:NO];
        [authenticationConnection scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [authenticationConnection start];
        NSLog(@"Ending..");
    }
    
    
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    if(connection == artifactConnection)
        [artifactData setLength:0];
    
    if(connection == authenticationConnection)
        [authenticationData setLength:0];
    
    
}


-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    if(connection == artifactConnection)
        [artifactData appendData:data];
    
    if(connection == authenticationConnection)
        [authenticationData appendData:data];
    
    
    
}

// to deal with self-signed certificates
- (BOOL)connection:(NSURLConnection *)connection canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace
{
    NSLog(@"%i",[protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust]);
    return [protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust];
    
}

- (void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
    if ([challenge.protectionSpace.authenticationMethod
         isEqualToString:NSURLAuthenticationMethodServerTrust])
    {
        // we only trust our own domain
        if ([challenge.protectionSpace.host isEqualToString:@"tmcrmapps.inservices.tatamotors.com"])
        {
            NSURLCredential *credential =
            [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];
            [challenge.sender useCredential:credential forAuthenticationChallenge:challenge];
        }
    }
    
    [challenge.sender continueWithoutCredentialForAuthenticationChallenge:challenge];
}


-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"inside..did");
    if(connection == artifactConnection)
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[artifactData mutableBytes] length:[artifactData length] encoding:NSUTF8StringEncoding];
        NSLog(@"Artifact Response is ..%@",responseString);
        
        NSNotification *artifactNotification = [NSNotification notificationWithName:@"artifactFound" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        
        [[NSNotificationQueue defaultQueue]enqueueNotification:artifactNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    
    if(connection == authenticationConnection)
    {
        NSString *responseString = [[NSString alloc] initWithBytes:[authenticationData mutableBytes] length:[authenticationData length] encoding:NSUTF8StringEncoding];
        NSLog(@"Authentication Response is ..%@",responseString);
        
        NSNotification *authenticationNotification = [NSNotification notificationWithName:@"authenticationFound" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:responseString,@"response", nil]];
        
        [[NSNotificationQueue defaultQueue]enqueueNotification:authenticationNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
    
}


- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    if(connection == artifactConnection)
    {
        NSDictionary *errDict;
        if([error.localizedDescription isEqualToString:@"The Internet connection appears to be offline."])
        {
            errDict=[NSDictionary dictionaryWithObjectsAndKeys:@"offline",@"error", nil];
        }
        NSNotification *errNotification = [NSNotification notificationWithName:@"artifactFailed" object:nil userInfo:errDict];
        [[NSNotificationQueue defaultQueue]enqueueNotification:errNotification postingStyle:NSPostNow coalesceMask:NSNotificationCoalescingOnName forModes:nil];
    }
}




@end
