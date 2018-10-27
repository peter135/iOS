//
//  CoreTextView.m
//  swiftDemo
//
//  Created by peter on 2018/10/13.
//  Copyright © 2018 Fubao. All rights reserved.
//

#import "CoreTextView.h"

//#import <CoreText/CoreText.h>

@interface CoreTextView ()

@property (strong,nonatomic) NSDictionary *data;

@end


@implementation CoreTextView


-(instancetype)initWithFrame:(CGRect)frame config:(NSDictionary*)dict;{
    
    if (self = [super initWithFrame:frame]) {
        
        self.data = dict;
        
    }
    
    return self;
}


//- (void)drawRect:(CGRect)rect {
//
//    [super drawRect:rect];
//
//       CGContextRef context = UIGraphicsGetCurrentContext();
//
//       CGContextSetTextMatrix(context, CGAffineTransformIdentity);
//       CGContextTranslateCTM(context, 0, 80);
//       CGContextScaleCTM(context, 1.0, -1.0);
//
//       CGMutablePathRef path = CGPathCreateMutable();
//       CGPathAddRect(path, NULL, CGRectMake(0, 0, 200, 80));
//
//       NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"xXHhofiyYI这是一段中文，前面是大小写"];
//
//       //    if (@available(iOS 10.0, *)) {
//       //        [attributedString addAttribute:(NSString *)kCTBackgroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 10)];
//       //    } else {
//       //        // Fallback on earlier versions
//       //    }
//
//       CTRunDelegateCallbacks imageCallBacks;
//       imageCallBacks.version = kCTRunDelegateCurrentVersion;
//       imageCallBacks.dealloc = ImgRunDelegateDeallocCallback;
//       imageCallBacks.getAscent = ImgRunDelegateGetAscentCallback;
//       imageCallBacks.getDescent = ImgRunDelegateGetDescentCallback;
//       imageCallBacks.getWidth = ImgRunDelegateGetWidthCallback;
//
//       NSString *imgName = @"basket_h";
//       CTRunDelegateRef imgRunDelegate = CTRunDelegateCreate(&imageCallBacks, (__bridge void * _Nullable)(imgName));//我们也可以传入其它参数
//       NSMutableAttributedString *imgAttributedStr = [[NSMutableAttributedString alloc]initWithString:@" "];
//       [imgAttributedStr addAttribute:(NSString *)kCTRunDelegateAttributeName value:(__bridge id)imgRunDelegate range:NSMakeRange(0, 1)];
//       CFRelease(imgRunDelegate);
//
//#define kImgName @"imgName"
//       //图片占位符添加
//       [imgAttributedStr addAttribute:kImgName value:imgName range:NSMakeRange(0, 1)];
//       [attributedString insertAttributedString:imgAttributedStr atIndex:10];
//
//
//
//       //step 4
//       CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attributedString);
//       CTFrameRef frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0,[attributedString length]), path, NULL);
//
//
//       //step 5
//       CTFrameDraw(frame, context);
//
//       CFArrayRef lines = CTFrameGetLines(frame);
//       CGPoint lineOrigins[CFArrayGetCount(lines)];
//       CTFrameGetLineOrigins(frame, CFRangeMake(0, 0), lineOrigins);//获取第行的起始点
//       for (int i = 0; i < CFArrayGetCount(lines); i++) {
//           CTLineRef line = CFArrayGetValueAtIndex(lines, i);
//           CGFloat lineAscent;//上缘线
//           CGFloat lineDescent;//下缘线
//           CGFloat lineLeading;//行间距
//           CTLineGetTypographicBounds(line, &lineAscent, &lineDescent, &lineLeading);//获取此行的字形参数
//
//           //获取此行中每个CTRun
//           CFArrayRef runs = CTLineGetGlyphRuns(line);
//           for(int j = 0;j< CFArrayGetCount(runs);j++){
//               NSLog(@"each lineOrigin %@",NSStringFromCGPoint(lineOrigins[i]));
//
//               CGFloat runAscent;//此CTRun上缘线
//               CGFloat runDescent;//此CTRun下缘线
//               CGPoint lineOrigin = lineOrigins[i];//此行起点
//
//               CTRunRef run = CFArrayGetValueAtIndex(runs, j);//获取此CTRun
//               NSDictionary *attributes = (NSDictionary *)CTRunGetAttributes(run);
//
//               CGRect runRect;
//               //获取此CTRun的上缘线，下缘线,并由此获取CTRun和宽度
//               runRect.size.width = CTRunGetTypographicBounds(run, CFRangeMake(0, 0), &runAscent, &runDescent, NULL);
//
//               //CTRun的X坐标
//               CGFloat runOrgX = lineOrigin.x + CTLineGetOffsetForStringIndex(line, CTRunGetStringRange(run).location, NULL);
//               runRect = CGRectMake(runOrgX,lineOrigin.y-runDescent,runRect.size.width,runAscent+runDescent );
//
//               NSString *imgName = [attributes objectForKey:kImgName];
//               if (imgName) {
//
//                   NSLog(@"runAscent %f runDescent %f lineOrigin %@",runAscent,runDescent,NSStringFromCGPoint(lineOrigin));
//
//                   UIImage *image = [UIImage imageNamed:imgName];
//                   if(image){
//
//                       CGRect imageRect ;
//                       imageRect.size = image.size;
//                       imageRect.origin.x = runRect.origin.x + lineOrigin.x;
//                       imageRect.origin.y = lineOrigin.y;
//
//                       NSLog(@"imageRect %@",NSStringFromCGRect(imageRect));
//
//                       CGContextDrawImage(context, imageRect, image.CGImage);
//                   }
//               }
//           }
//       }
//
//       CFRelease(frame);
//       CFRelease(path);
//       CFRelease(frameSetter);
//
//
//}

-(void)diplayAsync{
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(200,80), false, 2);
        
        NSString *imgName = @"basket_h";
        UIImage *image = [UIImage imageNamed:imgName];
        if(image){
            [image drawInRect:CGRectMake(10, 10, 28.5, 28.5)];
        }
        
        
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        
        paragraphStyle.lineSpacing = 10;// 字体的行间距
        
        paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
        
        paragraphStyle.minimumLineHeight = 44;


//
//        paragraphStyle.firstLineHeadIndent = 20.0f;//首行缩进
//
//        paragraphStyle.alignment = NSTextAlignmentJustified;//（两端对齐的）文本对齐方式：（左，中，右，两端对齐，自然）
//
//        paragraphStyle.lineBreakMode = NSLineBreakByClipping;//结尾部分的内容以……方式省略 ( "...wxyz" ,"abcd..." ,"ab...yz")
        
//        paragraphStyle.headIndent = 20;//整体缩进(首行除外)
//
//        paragraphStyle.tailIndent = 20;//尾部缩进
//
//        paragraphStyle.minimumLineHeight = 10;//最低行高
//
//        paragraphStyle.maximumLineHeight = 20;//最大行高
//
//        paragraphStyle.paragraphSpacing = 15;//段与段之间的间距
//
//        paragraphStyle.paragraphSpacingBefore = 22.0f;//段首行空白空间/* Distance between the bottom of the previous paragraph (or the end of its paragraphSpacing, if any) and the top of this paragraph. */
//
//        paragraphStyle.baseWritingDirection = NSWritingDirectionLeftToRight;//从左到右的书写方向（一共➡️⬇️⬅️三种）
//
//        paragraphStyle.lineHeightMultiple = 15;/* Natural line height is multiplied by this factor (if positive) before being constrained by minimum and maximum line height. */
//
//        paragraphStyle.hyphenationFactor = 1;

        
        
        NSString *string = @"测试数据";
        if(string){
            
//            UIColor *whiteColor = [UIColor redColor];
//
//            UIFont *font = [UIFont systemFontOfSize:17];
//
//            NSAttributedString *attributeString = [[NSAttributedString alloc] initWithString:string attributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:whiteColor,NSParagraphStyleAttributeName:paragraphStyle}];
            
            
            NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc] initWithString:@"今天天气不错呀呀呀呀"];
            
            [AttributedStr addAttribute:NSFontAttributeName
             
                                  value:[UIFont systemFontOfSize:14.0]
             
                                  range:NSMakeRange(0, 2)];
            
            
            [AttributedStr addAttribute:NSFontAttributeName
             
                                  value:[UIFont systemFontOfSize:17.0]
             
                                  range:NSMakeRange(2,4)];
      
             [AttributedStr addAttribute:NSForegroundColorAttributeName
                                   value:[UIColor redColor]
                                   range:NSMakeRange(5, 3)];
            
            
            NSTextAttachment *attachment = [[NSTextAttachment alloc]initWithData:nil ofType:nil];
            UIImage *image = [UIImage imageNamed:@"通用蓝"];
            attachment.image = image;
            attachment.bounds = CGRectMake(0, 0, 22, 22);
            
            NSAttributedString *text = [NSAttributedString attributedStringWithAttachment:attachment];
            [AttributedStr insertAttributedString:text atIndex:5];
            
            
//
//            NSAttributedString* attachmentString = [NSAttributedString attributedStringWithAttachment:attachment];

            
            
            CGFloat height = [AttributedStr boundingRectWithSize:CGSizeMake(100, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesDeviceMetrics|NSStringDrawingTruncatesLastVisibleLine context:NULL].size.height;
            
            [AttributedStr drawInRect:CGRectMake(40, 20, 100, height)];

             NSLog(@"size with attribute %f",height);

//            CGSize size = [@"测试数据**********测试数据**********" sizeWithAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:whiteColor,NSParagraphStyleAttributeName:paragraphStyle}];
//            NSLog(@"size with attribute %@",NSStringFromCGSize(size));
        
        }
        

        
        
        UIImage *temp = UIGraphicsGetImageFromCurrentImageContext();
        
        
        UIGraphicsEndImageContext();
        
        
        // draw in context...
        //       CGImageRef img = CGBitmapContextCreateImage(context);
        //       CFRelease(context);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
//            UIImageView *view= [[UIImageView alloc] initWithImage:temp];
//
//            view.frame = self.bounds;
//
//            [self addSubview:view];
            
            self.layer.contents = (id)temp.CGImage;
            
            
        });
        
        
    });
    
}

#pragma mark - CTRunDelegateCallbacks

void ImgRunDelegateDeallocCallback( void* refCon ){
    
}

CGFloat ImgRunDelegateGetAscentCallback( void *refCon ){
    NSString *imageName = (__bridge NSString *)refCon;
    return [UIImage imageNamed:imageName].size.height;
}

CGFloat ImgRunDelegateGetDescentCallback(void *refCon){
    return 0;
}

CGFloat ImgRunDelegateGetWidthCallback(void *refCon){
    NSString *imageName = (__bridge NSString *)refCon;
    return [UIImage imageNamed:imageName].size.width;
}

@end
