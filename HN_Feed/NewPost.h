//
//  NewPost.h
//  HN_Feed
//
//  Created by Sebastián Valencia on 7/17/14.
//  Copyright (c) 2014 scvalencia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewPost : NSObject

@property(nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSURL *linkToUser;
@property (nonatomic, strong) NSURL *linkToComments;
@property (nonatomic, strong) NSString *number;
@property (nonatomic, strong) NSString *numberOfComments;
@property (nonatomic, strong) NSString *sourceName;
@property (nonatomic, strong) NSString *points;
@property (nonatomic, strong) NSURL *linkToSource;
@property (nonatomic, strong) NSString *user;
@property (nonatomic, strong) NSString *time;
@property (nonatomic, strong) NSString *ID;
@property BOOL hiringPost;


- (id) initWithTitle:(NSString *)title;
+ (id) newPostAndTitle:(NSString *) title;
- (NSURL *) faviconURL;
- (NSString *) generateTitle;
- (NSString *) generateSubtitle;
- (NSString *) description;
@end