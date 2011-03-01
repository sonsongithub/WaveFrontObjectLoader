//
//  MyGLView.m
//  GLESTest
//
//  Created by sonson on 10/12/24.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MyGLView.h"

static float focal = 649.590771179639773;

@implementation MyGLView

-(void)setupOpenGLView {
	const GLfloat			lightAmbient[] = {0.2, 0.2, 0.2, 1.0};
	const GLfloat			lightDiffuse[] = {1.0, 0.6, 0.0, 1.0};
	const GLfloat			matAmbient[] = {0.6, 0.6, 0.6, 1.0};
	const GLfloat			matDiffuse[] = {1.0, 1.0, 1.0, 1.0};	
	const GLfloat			matSpecular[] = {1.0, 1.0, 1.0, 1.0};
	const GLfloat			lightPosition[] = {0.0, 0.0, 1.0, 0.0}; 
	const GLfloat			lightShininess = 100.0;
	
	//Configure OpenGL lighting
	glEnable(GL_LIGHTING);
	glEnable(GL_LIGHT0);
	glMaterialfv(GL_FRONT_AND_BACK, GL_AMBIENT, matAmbient);
	glMaterialfv(GL_FRONT_AND_BACK, GL_DIFFUSE, matDiffuse);
	glMaterialfv(GL_FRONT_AND_BACK, GL_SPECULAR, matSpecular);
	glMaterialf(GL_FRONT_AND_BACK, GL_SHININESS, lightShininess);
	glLightfv(GL_LIGHT0, GL_AMBIENT, lightAmbient);
	glLightfv(GL_LIGHT0, GL_DIFFUSE, lightDiffuse);
	glLightfv(GL_LIGHT0, GL_POSITION, lightPosition); 			
	glShadeModel(GL_SMOOTH);
	glEnable(GL_DEPTH_TEST);
	glEnable(GL_NORMALIZE);
    
#define _NAMED
	
#ifdef _NAMED
    objNamed = [OpenGLWaveFrontObject objectNamed:@"earth_.obj"];
    [objNamed retain];
#else
    NSString *fullpath = @"/Users/sonson/Desktop/WaveFrontObjectLoader/Models/earth.obj";
	obj = [[OpenGLWaveFrontObject alloc] initWithContentsOfFile:fullpath];
#endif
	t = 0;
}

- (void)drawSomething {
	CGRect rect = self.frame;
	
	float m[16];
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	glOrthof(-0.5*rect.size.width, 0.5*rect.size.width, 0.5*rect.size.height, -0.5*rect.size.height, 0.001, 1000);
	glViewport(0, 0, rect.size.width, rect.size.height);
	glMatrixMode(GL_MODELVIEW);
	
	glLoadIdentity();
	m[0] = focal;	m[4] = 0;		m[8] = 0;		m[12] = 0;
	m[1] = 0;		m[5] = focal;	m[9] = 0;		m[13] = 0;
	m[2] = 0;		m[6] = 0;		m[10] = 1001;	m[14] = 1000;
	m[3] = 0;		m[7] = 0;		m[11] = -1;		m[15] = 0;
	
    t+=1;
    
	glMultMatrixf(m);
    
#ifdef _NAMED
    glPushMatrix();
	glTranslatef(0, 1.2, -12 + 3 * sin(t/10));    
    glRotatef(t, 1, 1, 0);
	[objNamed drawSelf];
    glPopMatrix();
#else
    glPushMatrix();
	glTranslatef(0, -1.2, -12 + 3 * sin(t/10));    
    glRotatef(t, 1, 1, 0);
	[obj drawSelf];
    glPopMatrix();
#endif
}

- (void)drawView {
	[EAGLContext setCurrentContext:context];
	
	glBindFramebufferOES(GL_FRAMEBUFFER_OES, viewFramebuffer);
	glClearColor(0.0f, 0.0f, 0.0f, 1);
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    
    [self drawSomething];
	
	glBindRenderbufferOES(GL_RENDERBUFFER_OES, viewRenderbuffer);
	[(EAGLContext*)context presentRenderbuffer:GL_RENDERBUFFER_OES];

}

@end
