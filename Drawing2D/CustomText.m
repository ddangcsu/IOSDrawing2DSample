//
//  CustomText.m
//  Drawing2D
//
//  Created by david on 12/8/16.
//  Copyright © 2016 David Dang. All rights reserved.
//

#import "CustomText.h"

@implementation CustomText

// Overwrite to perform the drawing
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    // And get the current graphic context
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Create a Path
	CGMutablePathRef path = CGPathCreateMutable();
    // Add the rectangle frame to path
    CGPathAddRect(path, NULL, rect);
    
    // Associate the path to the context
    CGContextAddPath(context, path);

    // Set the line width to 2 point
    CGContextSetLineWidth(context, 5.0f);
    // Set color for the stroke to red
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    // Draw the path using the stroke type
    CGContextStrokePath(context);
    
    // We now declare a string, set the font name/size, make the point where it will
    // start drawing.  Set the attributes for the drawing with font, textColor, and
    // background color.  Then tell the string to draw itself at the point
    NSString *myString = @"CPSC411 is great !";
    UIFont *myFont = [UIFont fontWithName:@"Arial" size:30.0f];
    CGPoint point = CGPointMake(rect.origin.x + 10, rect.origin.y + 10);
	
    NSDictionary* attributes = @{NSFontAttributeName: myFont,
                                 NSForegroundColorAttributeName: [UIColor greenColor],
                                 NSBackgroundColorAttributeName: [UIColor grayColor]};
    
    [myString drawAtPoint:point withAttributes:attributes];
    
}


@end
