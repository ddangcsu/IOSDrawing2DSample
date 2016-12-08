//
//  Canvas.m
//  Drawing2D
//
//  Created by david on 12/8/16.
//  Copyright © 2016 David Dang. All rights reserved.
//

#import "Canvas.h"

@interface Canvas()
// The Drawing Path
@property CGMutablePathRef path;
// The Graphic Context of the Canvas
@property CGContextRef context;

@end

@implementation Canvas

// Overwrite to perform the drawing
- (void)drawRect:(CGRect)rect {
    //[super drawRect:rect];
    // And get the current graphic context
    if (self.context == nil) {
	    self.context = UIGraphicsGetCurrentContext();
    }
    
    // Create a path if not already there
    if (self.path == nil) {
        self.path = CGPathCreateMutable();
        
        // Add the frame in there
        CGPathAddRect(self.path, NULL, rect);

    }
  
    // Add the Path to current context
    CGContextAddPath(self.context, self.path);
    
    // Set the line width to 2 point
    CGContextSetLineWidth(self.context, 2.0f);
    
    // Set color for the stroke to red
    CGContextSetStrokeColorWithColor(self.context, [UIColor blueColor].CGColor);
   
    // Draw the path using the stroke type
    CGContextStrokePath(self.context);

}

// Below are all the event handling to draw with hand
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // We need to get the starting point or coordinate on the Canvas
    // Get the point that the user touch on the canvas
    CGPoint point = [[touches anyObject] preciseLocationInView:self];
    
    // We move the path to the point where the user touch
    // This is like setting the beginning of the path
    CGPathMoveToPoint(self.path, NULL, point.x, point.y);

}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // In here is where we will connect the dot
    // Get the coordinate that the user move to on this canvas
    CGPoint point = [[touches anyObject] preciseLocationInView:self];
    
    // We then connect the dot in the path
    CGPathAddLineToPoint(self.path, NULL, point.x, point.y);
    
    // Now we tell the canvas to refresh
    [self setNeedsDisplay];
}

@end
