//
//  ImageModel.m
//  UserInterfaceExample
//
//  Created by Eric Larson on 9/2/20.
//  Copyright © 2020 Eric Larson. All rights reserved.
//

#import "ImageModel.h"

@interface ImageModel ()

@property (strong, nonatomic) NSArray* imageNames;
@property (strong, nonatomic) NSDictionary* images;

@end

@implementation ImageModel
@synthesize imageNames = _imageNames;
@synthesize images = _images;

+(ImageModel*)sharedInstance{
    static ImageModel* _sharedInstance = nil;
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        _sharedInstance = [[ImageModel alloc] init];
    } );
    return _sharedInstance;
}

-(NSArray*) imageNames{
    if(!_imageNames)
        _imageNames = @[@"Bill",@"Eric",@"Jeff"];
    
    return _imageNames; 
}

-(NSDictionary*) images{
    if (!_images)
        _images = @{@"Bill" : [UIImage imageNamed:@"Bill"], @"Eric" : [UIImage imageNamed:@"Eric"], @"Jeff" : [UIImage imageNamed:@"Jeff"]};
    return _images;
}


-(UIImage*)getImageWithName:(NSString*)name{
    return [self.images objectForKey:name];
}

-(UIImage*)getImageWithIndex:(NSInteger)index{
    return [self.images objectForKey:self.imageNames[index]];
}

-(NSInteger) numberOfImages{
    return [self.images count];
}

-(NSString*) getImageNameForIndex:(NSInteger)index {
    return self.imageNames[index];
}

@end
