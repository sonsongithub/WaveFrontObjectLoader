//
//  MyGLView.h
//  GLESTest
//
//  Created by sonson on 10/12/24.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "GLView.h"

#import "OpenGLWaveFrontObject.h"

@interface MyGLView : GLView {
	float t;
    OpenGLWaveFrontObject *objNamed;
    OpenGLWaveFrontObject *obj;
}

@end
