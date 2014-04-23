//
//  D1.m
//  UIBezierPath
//
//  Created by YunInfo on 14-4-23.
//  Copyright (c) 2014年 Yuninfo. All rights reserved.
//

#import "D1.h"

@implementation D1

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)dealloc
{
    self.myPath = nil;
}
- (void)drawRect:(CGRect)rect
{
    // Create an oval shape to draw.
    UIBezierPath *aPath = [UIBezierPath bezierPathWithOvalInRect:
                           CGRectMake(0, 0, 200, 100)];
    
    self.myPath = aPath;
    // Set the render colors.
        [[UIColor redColor] setFill];
    [[UIColor blackColor] setStroke];

//    
    CGContextRef aRef = UIGraphicsGetCurrentContext();
//    
//    // If you have content to draw after the shape,
//    // save the current state before changing the transform.
//    //CGContextSaveGState(aRef);
//    
//    // Adjust the view's origin temporarily. The oval is
//    // now drawn relative to the new origin point.
     CGContextTranslateCTM(aRef, self.frame.size.width/2 - aPath.bounds.size.width/2, self.frame.size.height/2 - aPath.bounds.size.height/2);
    
    // Adjust the drawing options as needed.
    aPath.lineWidth = 5;
    
    // Fill the path before stroking it so that the fill
    // color does not obscure the stroked line.
     [aPath fill];
    [aPath stroke];
   
    
    
    // Restore the graphics state before drawing any other content.
    //CGContextRestoreGState(aRef);
}


- (BOOL)containsPoint:(CGPoint)point onPath:(UIBezierPath *)path inFillArea:(BOOL)inFill
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGPathRef cgPath = path.CGPath;
    BOOL    isHit = NO;
    
    // Determine the drawing mode to use. Default to
    // detecting hits on the stroked portion of the path.
    CGPathDrawingMode mode = kCGPathStroke;
    if (inFill)
    {
        // Look for hits in the fill area of the path instead.
        if (path.usesEvenOddFillRule)
            mode = kCGPathEOFill;
        else
            mode = kCGPathFill;
    }
    
    // Save the graphics state so that the path can be
    // removed later.
    CGContextSaveGState(context);
    CGContextAddPath(context, cgPath);
    
    // Do the hit detection.
    isHit = CGContextPathContainsPoint(context, point, mode);
    
    CGContextRestoreGState(context);
    
    return isHit;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch * touch = [touches anyObject];
    CGPoint  point = [touch locationInView:self];
    
    
                      
    if ([self containsPoint:point onPath:self.myPath inFillArea:NO])
    {
        NSLog(@" point(%f,%f) is in FillArea", point.x , point.y);
    }
    else
    {
        NSLog(@" point(%f,%f) is  not in FillArea", point.x , point.y);

    }
    

    
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{

}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{

}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

@end
