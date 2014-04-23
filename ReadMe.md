#这是一个关于 UIBezierPath的小demo

 1 这个类不看不知道，一看吓一跳，居然是在UIKit里面的，用于给view增加各类线性，弧形（圆或椭圆），以及贝塞尔曲线，***假如某人声称他掌握了UIKit，可以拿这个来考他***。
 
 它也可以注册到 CGPath 的 CGPath里去，这意味着。。跟Core Graphic 框架打交道
 
 
 2 两种渲染颜色 在画布 模型上是有区别的 ，自己画来看看。。
      [aPath fill];
    [aPath stroke];

 
  
 3 在一般情况下，UIBezierPath的渲染也是在CGContextRef（UIGraphicsGetCurrentContext()）里初始化的，所以在设定形状位置的时候，官方推荐使用 translateCTM的方式来，因为这样可以undo
 
    CGContextTranslateCTM(aRef, self.frame.size.width/2 - aPath.bounds.size.width/2, self.frame.size.height/2 - aPath.bounds.size.height/2);
    
    
 4 UIkit的东西是一定考虑交互的，官方提供的
 
   1 containsPoint: 只能在在closed path下使用，只检测是否在path内和外
   2 CGContextPathContainsPoint 可以检测点再间距还是里面的填充区域
   
   
 
 