//
//  InstagramEngine.h
//  SummerWarsInstagram
//
//  Created by HappyEngineer on 7/26/14.
//  Copyright (c) 2014 Happy__Engineer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@class InstagramUser;
@class InstagramMedia;
@class InstagramPaginationInfo;
@class InstagramTag;

typedef void(^InstagramLoginBlock)(NSError *error);
typedef void(^InstagramMediaBlock)(NSArray *media, InstagramPaginationInfo *paginationInfo);
typedef void(^InstagramFailureBlock)(NSError *error);
typedef void(^InstagramTagsBlock)(NSArray *tags, InstagramPaginationInfo *paginationInfo);
typedef void(^InstagramCommentsBlock)(NSArray *comments);

typedef NS_ENUM(NSUInteger, MaxIdKeyType) {
    kPaginationMaxId,
    kPaginationMaxLikeId,
    kPaginationMaxTagId,
};

typedef NS_ENUM(NSUInteger, InstagramInfoErrorCode) {
    kInstagramInfoErrorCodeNone,
    kInstagramInfoErrorCodeAccessNotGranted,
    kInstagramInfoErrorCodeUserCancelled = NSUserCancelledError,
    
};

@interface InstagramEngine : NSObject

@property (nonatomic, copy) NSString *appClientID;
@property (nonatomic, copy) NSString *appRedirectURL;
@property (nonatomic, copy) NSString *authorizationURL;

@property (nonatomic, copy) NSString *accessToken;

+ (InstagramEngine *)sharedManager;
+ (NSDictionary*)sharedEngineConfiguration;

#pragma mark - Login -

- (void)loginWithBlock:(InstagramLoginBlock)block;

- (void)cancelLogin;

/*
- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation;
*/

#pragma mark - Media -


- (void)getMedia:(NSString *)mediaId
     withSuccess:(void (^)(InstagramMedia *media))success
         failure:(InstagramFailureBlock)failure;


- (void)getPopularMediaWithSuccess:(InstagramMediaBlock)success
                           failure:(InstagramFailureBlock)failure;

#pragma mark -


- (void)getMediaAtLocation:(CLLocationCoordinate2D)location
               withSuccess:(InstagramMediaBlock)success
                   failure:(InstagramFailureBlock)failure;

- (void)getMediaAtLocation:(CLLocationCoordinate2D)location count:(NSInteger)count maxId:(NSString *)maxId
               withSuccess:(InstagramMediaBlock)success
                   failure:(InstagramFailureBlock)failure;



#pragma mark - Users -


- (void)getUserDetails:(InstagramUser *)user
           withSuccess:(void (^)(InstagramUser *userDetail))success
               failure:(InstagramFailureBlock)failure;

#pragma mark -


- (void)getMediaForUser:(NSString *)userId
            withSuccess:(InstagramMediaBlock)success
                failure:(InstagramFailureBlock)failure;

- (void)getMediaForUser:(NSString *)userId count:(NSInteger)count maxId:(NSString *)maxId
            withSuccess:(InstagramMediaBlock)success
                failure:(InstagramFailureBlock)failure;

#pragma mark -


- (void)searchUsersWithString:(NSString *)string
                  withSuccess:(void (^)(NSArray *users, InstagramPaginationInfo *paginationInfo))success
                      failure:(InstagramFailureBlock)failure;



#pragma mark - Self User -


- (void)getSelfUserDetailsWithSuccess:(void (^)(InstagramUser *userDetail))success
                              failure:(InstagramFailureBlock)failure;

#pragma mark -


- (void)getSelfFeedWithSuccess:(InstagramMediaBlock)success
                       failure:(InstagramFailureBlock)failure;

- (void)getSelfFeedWithCount:(NSInteger)count maxId:(NSString *)maxId
                     success:(InstagramMediaBlock)success
                     failure:(InstagramFailureBlock)failure;

#pragma mark -


- (void)getMediaLikedBySelfWithSuccess:(InstagramMediaBlock)success
                               failure:(InstagramFailureBlock)failure;

- (void)getMediaLikedBySelfWithCount:(NSInteger)count maxId:(NSString *)maxId
                             success:(InstagramMediaBlock)success
                             failure:(InstagramFailureBlock)failure;



#pragma mark - Tags -


- (void)getTagDetailsWithName:(NSString *)name
                  withSuccess:(void (^)(InstagramTag *tag))success
                      failure:(InstagramFailureBlock)failure;

#pragma mark -


- (void)getMediaWithTagName:(NSString *)tag
                withSuccess:(InstagramMediaBlock)success
                    failure:(InstagramFailureBlock)failure;

- (void)getMediaWithTagName:(NSString *)tag count:(NSInteger)count maxId:(NSString *)maxId
                withSuccess:(InstagramMediaBlock)success
                    failure:(InstagramFailureBlock)failure;

#pragma mark -


- (void)searchTagsWithName:(NSString *)name
               withSuccess:(InstagramTagsBlock)success
                   failure:(InstagramFailureBlock)failure;

- (void)searchTagsWithName:(NSString *)name count:(NSInteger)count maxId:(NSString *)maxId
               withSuccess:(InstagramTagsBlock)success
                   failure:(InstagramFailureBlock)failure;



#pragma mark - Comments -


- (void)getCommentsOnMedia:(InstagramMedia *)media
               withSuccess:(InstagramCommentsBlock)success
                   failure:(InstagramFailureBlock)failure;

- (void)createComment:(NSString *)commentText
              onMedia:(InstagramMedia *)media
          withSuccess:(void (^)(void))success
              failure:(InstagramFailureBlock)failure;

- (void)removeComment:(NSString *)commentId
              onMedia:(InstagramMedia *)media
          withSuccess:(void (^)(void))success
              failure:(InstagramFailureBlock)failure;


#pragma mark - Likes -


- (void)getLikesOnMedia:(InstagramMedia *)media
            withSuccess:(void (^)(NSArray *likedUsers))success
                failure:(InstagramFailureBlock)failure;

- (void)likeMedia:(InstagramMedia *)media
      withSuccess:(void (^)(void))success
          failure:(InstagramFailureBlock)failure;

- (void)unlikeMedia:(InstagramMedia *)media
        withSuccess:(void (^)(void))success
            failure:(InstagramFailureBlock)failure;


#pragma mark - Relationships -


- (void)getRelationshipStatusOfUser:(NSString *)userId
                        withSuccess:(void (^)(NSDictionary *responseDictionary))success
                            failure:(void (^)(NSError* error))failure;

- (void)getUsersFollowedByUser:(NSString *)userId
                   withSuccess:(void (^)(NSArray *usersFollowed))success
                       failure:(void (^)(NSError* error))failure;

- (void)getFollowersOfUser:(NSString *)userId
               withSuccess:(void (^)(NSArray *followers))success
                   failure:(void (^)(NSError* error))failure;

- (void)getFollowRequestsWithSuccess:(void (^)(NSArray *requestedUsers))success
                             failure:(void (^)(NSError* error))failure;

- (void)followUser:(NSString *)userId
       withSuccess:(void (^)(NSDictionary *response))success
           failure:(void (^)(NSError* error))failure;

- (void)unfollowUser:(NSString *)userId
         withSuccess:(void (^)(NSDictionary *response))success
             failure:(void (^)(NSError* error))failure;

- (void)blockUser:(NSString *)userId
      withSuccess:(void (^)(NSDictionary *response))success
          failure:(void (^)(NSError* error))failure;

- (void)unblockUser:(NSString *)userId
        withSuccess:(void (^)(NSDictionary *response))success
            failure:(void (^)(NSError* error))failure;

- (void)approveUser:(NSString *)userId
        withSuccess:(void (^)(NSDictionary *response))success
            failure:(void (^)(NSError* error))failure;

- (void)denyUser:(NSString *)userId
     withSuccess:(void (^)(NSDictionary *response))success
         failure:(void (^)(NSError* error))failure;


#pragma mark - Common Pagination Request -

- (void)getPaginatedItemsForInfo:(InstagramPaginationInfo *)paginationInfo
                     withSuccess:(InstagramMediaBlock)success
                         failure:(InstagramFailureBlock)failure;

@end
