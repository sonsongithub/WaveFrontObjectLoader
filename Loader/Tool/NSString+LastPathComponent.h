//
//  NSString+LastPathComponent.h
//  CoreAR
//
//  Created by sonson on 11/02/15.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString(LastPathComponent)
- (NSString*)stringByExtractingLastPathComponent;
- (NSString*)stringByExtractingPathExtention;
@end
