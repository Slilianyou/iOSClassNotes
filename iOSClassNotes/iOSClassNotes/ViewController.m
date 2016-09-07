//
//  ViewController.m
//  iOSClassNotes
//
//  Created by ss-iOS-LLY on 16/9/6.
//  Copyright © 2016年 lilianyou. All rights reserved.
//

#import "ViewController.h"
#import <CoreText/CoreText.h>


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake( 0, 100, [UIScreen mainScreen].bounds.size.width,100 )];
    //背景色
    label.backgroundColor = [UIColor orangeColor];
    //文本赋值
    label.text = @"啊啊啊啊啊fagagasgasgasgasgagagasgasgaaga";
    // 标签字体颜色
    label.textColor = [UIColor redColor];
    // 标签文本的行数限制
    label.numberOfLines= 1;
    //折行显示类型
    label.lineBreakMode = NSLineBreakByWordWrapping;
    //阴影颜色
    label.shadowColor = [UIColor whiteColor];
    //阴影偏移量
    label.shadowOffset =CGSizeMake(-3, -3);
    //标签文本对齐方式
    label.textAlignment = NSTextAlignmentNatural;
    // 添加到父视图
    [self.view addSubview:label];
    
    //富文本
    NSString *string = @"Label Text Content, This is a text label things attribut  哈法就是感觉啊说得好干净啊帅哥还 u 送给和我 i 怀念的官方报价多少倍 vu 爱薄荷膏服务诶反光板 v 啊世界杯官方 v";
    const CGFloat fontSize = 30.f;
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc]initWithString:string];
    // 字符串长度
    NSUInteger length = [string length];
    // 设置字体
    UIFont *baseFont = [UIFont systemFontOfSize:fontSize];
    [attrString addAttribute:NSFontAttributeName value:baseFont range:NSMakeRange(0, length)];
    // 设置Text这四个字母的字体为粗体
    [attrString addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:fontSize] range:[string rangeOfString:@"Text"]];
    //    // 设置倾斜，需要导入CoreText
    //    UIFont *italicFont = GetVariationOfFontWithTrait(baseFont, kCTFontItalicTrait);
    //    [attrString addAttribute:NSFontAttributeName value:italicFont range:[string rangeOfString:@"Label"]];
    // 设置颜色
    [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:[string rangeOfString:@"Content"]];
    
    //字体
    [attrString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Verdana-BoldItalic" size:24.f] range:[string rangeOfString:@"Label"]];
    label.numberOfLines = 2;
    
    
    //  段落
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle defaultParagraphStyle]mutableCopy];
    style.lineSpacing = 10;  //增加行高
    style.headIndent = 10;  //头部缩进
    style.tailIndent = -10; // 尾部缩进
    style.lineHeightMultiple = 1.5; // 行间距是多少倍
    style.alignment = NSTextAlignmentLeft;  //对齐方式
    style.firstLineHeadIndent = 20; //首行头缩进
    style.paragraphSpacing = 10;  //段落后面的间距
    style.paragraphSpacingBefore = 20;  //段落之间的间距
    [attrString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, length)];
    [attrString addAttribute:NSKernAttributeName value:@2 range:NSMakeRange(0, length)]; //字符间距 2pt
    [attrString addAttribute:NSStrokeColorAttributeName value:[UIColor blueColor] range:[string rangeOfString:@"is"]];//设置文字描边颜色，需要和NSStrokeWidthAttributeName设置描边宽度，这样就能使文字空心
    [attrString addAttribute:NSStrokeWidthAttributeName value:@2 range:[string rangeOfString:@"is"]]; //空心字，文字边框描述
    [attrString addAttribute:NSUnderlineStyleAttributeName value:@(NSUnderlineStyleSingle) range:[string rangeOfString:@"text"]]; //下划线
    [attrString addAttribute:NSUnderlineStyleAttributeName value:@(NSUnderlineStyleThick) range:[string rangeOfString:@"label"]]; //厚的下划线
    [attrString addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:[string rangeOfString:  @"things"]]; // 删除线
    [attrString addAttribute:NSStrikethroughColorAttributeName value:[UIColor redColor] range:[string rangeOfString:  @"things"]]; // 删除线 红色
    label.attributedText = attrString;
    
    label.highlightedTextColor = [UIColor redColor];//设置文本高亮显示颜色，与highlighted一起使用。
    label.highlighted = YES;//高亮状态是否打开
    label.userInteractionEnabled = YES;//设置标签是否忽略或移除用户交互。默认为NO
    label.enabled = NO; // 文字是否可变
    [label sizeToFit];
    label.adjustsFontSizeToFitWidth = YES;
    label.minimumScaleFactor = 0.5;
    label.baselineAdjustment = UIBaselineAdjustmentAlignBaselines;//如果adjustsFontSizeToFitWidth属性设置为YES，这个属性就来控制文本基线的行为。
    //        UIBaselineAdjustmentAlignBaselines=0，默认，文本最上端与中线对齐。
    //        UIBaselineAdjustmentAlignCenters,   文本中线与label中线对齐。
    //        UIBaselineAdjustmentNone,  文本最低端与label中线对齐。;
    [self.view addSubview:label];
    
    
    
    /*有些属性需要  单行设置
     self.label.numberOfLines = 1;
     
     minimumScaleFactor
     adjustsFontSizeToFitWidth
     baselineAdjustment
     */
    
    /**
     *  .文本自动根据label大小自动调整字体尺寸label.numberOfLines =1;    label.adjustsFontSizeToFitWidth =YES;    adjustFontSizeToFitWidth方法可实现文本自动根据label大小自动调整字体尺寸，直到文本的大小达到了自己设置的label文本尺寸最大、最小值与字符串的最大最小值，要是用这个方法还有一个很大的限制就是只有在numberOfLines设置为1时才能用这个方法;如果行数是超过了1行，要实现自动调整字体大小功能，就没有可以自适应的系统方法可以使用，只有自己用代码实现，在设计时因为要考虑到手机屏幕的实际大小有限，如果字体太小会影响用户体验，所以要设置一个最小字号的判断，小于最小字号就要用到缩略显示.
     
     文／阳光大道在前方（简书作者）
     原文链接：http://www.jianshu.com/p/1c3076c12b1b
     著作权归作者所有，转载请联系作者获得授权，并标注“简书作者”。
     */
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

// 获取斜体
UIFont * GetVariationOfFontWithTrait(UIFont *baseFont,CTFontSymbolicTraits trait)
{
    CGFloat fontSize = [baseFont pointSize];
    CFStringRef baseFontName = (__bridge CFStringRef)[baseFont fontName];
    CTFontRef baseCTFont = CTFontCreateWithName(baseFontName, fontSize, NULL);
    CTFontRef ctFont = CTFontCreateCopyWithSymbolicTraits(baseCTFont, 0, NULL, trait, trait);
    
    NSString *variantFontName = CFBridgingRelease(CTFontCopyName(ctFont, kCTFontPostScriptNameKey));
    UIFont *variantFont = [UIFont fontWithName:variantFontName size:fontSize];
    CFRelease(ctFont);
    CFRelease(baseCTFont);
    return variantFont;
}




























































- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
