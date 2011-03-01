//
//  NSString+LastPathComponent.m
//  CoreAR
//
//  Created by sonson on 11/02/15.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NSString+LastPathComponent.h"


@implementation NSString(LastPathComponent)

- (NSString*)stringByExtractingLastPathComponent {
    NSString *lastPathComponent = [self stringByDeletingLastPathComponent];
    return [self substringWithRange:NSMakeRange([lastPathComponent length], [self length] - [lastPathComponent length])];
}

- (NSString*)stringByExtractingPathExtention {
    NSString *lastPathExtention = [self stringByDeletingPathExtension];
    return [self substringWithRange:NSMakeRange([lastPathExtention length], [self length] - [lastPathExtention length])];
}

@end
