//
//  MappingProvider.h
//  WhereForLunch
//
//  Created by Cameron Woodmansee on 4/12/13.
//  Copyright (c) 2013 Cameron Woodmansee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>

@interface MappingProvider : NSObject

+ (RKMapping *)venueMapping;

@end
