//
//  NewPost.m
//  HN_Feed
//
//  Created by Sebastián Valencia on 7/17/14.
//  Copyright (c) 2014 scvalencia. All rights reserved.
//

#import "NewPost.h"

@implementation NewPost

- (id) initWithTitle:(NSString *) title {
    
    self = [super init];
    
    if(self) {
        
        self.title = title;
        self.linkToUser = nil;
        self.linkToComments = nil;
        self.number = nil;
        self.numberOfComments = nil;
        self.sourceName = nil;
        self.points = nil;
        self.linkToSource = nil;
        self.user = nil;
        self.time = nil;
        self.ID = nil;
        
    }
    
    return self;
}

+ (id) newPostAndTitle:(NSString *) title {
    return [[self alloc] initWithTitle:title];
}

- (NSURL*) faviconURL {
    NSString *getFaviconAPIPage = @"http://getfavicon.appspot.com/";
    NSString *mainSourcePage = [self.linkToSource absoluteString];
    NSMutableString *wholeFaviconSource = [[NSMutableString alloc] init];
    [wholeFaviconSource appendString:getFaviconAPIPage];
    [wholeFaviconSource appendString:mainSourcePage];
    NSURL *toReturn = [NSURL URLWithString:wholeFaviconSource];
    return toReturn;
}

- (NSString *) generateTitle {
    NSMutableString *toReturn = [[NSMutableString alloc] init];
    [toReturn appendFormat:@"%@. %@\n\n", self.number, self. title];
    return toReturn;
}

- (NSString *) generateSubtitle {
    if(self.hiringPost)
        return @"";
    NSMutableString *toReturn = [[NSMutableString alloc] init];
    [toReturn appendFormat:@"%@ | %@ | %@", self.user, self. points, self.numberOfComments];
    return toReturn;
}

- (NSString *) description {
    NSMutableString *toReturn = [[NSMutableString alloc] init];
    [toReturn appendString:@"\n"];
    [toReturn appendFormat:@"New: %@ :: %@, %@\n", self.ID, self.number, self.title];
    [toReturn appendFormat:@"Hiring: %@\n", self.hiringPost ? @"Yes" : @"No"];
    [toReturn appendFormat:@"Source Info: %@, %@\n", self.sourceName, self.linkToSource];
    [toReturn appendFormat:@"User Info: %@, %@\n", self.user, self.linkToUser];
    [toReturn appendFormat:@"General Info: %@, %@, %@\n", self.time, self.numberOfComments, self.points];
    return toReturn;
}

@end
