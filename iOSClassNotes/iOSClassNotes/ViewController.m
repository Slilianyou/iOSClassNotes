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
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake( 0, 100, [UIScreen mainScreen].bounds.size.width,100 )];
    label.backgroundColor = [UIColor orangeColor];
//    label.text = @"啊啊啊啊啊fagagasgasgasgasgagagasgasgaaga";
//    label.textColor = [UIColor redColor];
//    label.numberOfLines= 1;
//    label.lineBreakMode = NSLineBreakByWordWrapping;
//    label.shadowColor = [UIColor whiteColor];
//    //    label.shadowOffset =CGSizeMake(-3, -3);
//    label.textAlignment = NSTextAlignmentNatural;
//    [self.view addSubview:label];

    //
    NSString *string = @"Label Text Content, This is a text label things attribut  哈法就是感觉啊说得好干净啊帅哥还 u 送给和我 i 怀念的官方报价多少倍 vu 爱薄荷膏服务诶反光板 v 啊世界杯官方 v";
    const CGFloat fontSize = 16.0;
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc]initWithString:string];
    NSUInteger length = [string length];
    // 设置字体
    UIFont *baseFont = [UIFont systemFontOfSize:fontSize];
    [attrString addAttribute:NSFontAttributeName value:baseFont range:NSMakeRange(0, length)];
    // 设置Text这四个字母的字体为粗体
    [attrString addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:fontSize] range:[string rangeOfString:@"Text"]];
    // 设置倾斜，需要导入CoreText
    UIFont *italicFont = GetVariationOfFontWithTrait(baseFont, kCTFontItalicTrait);
    [attrString addAttribute:NSFontAttributeName value:italicFont range:[string rangeOfString:@"Label"]];
    // 设置颜色
    [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:[string rangeOfString:@"Content"]];
    
    //字体
    [attrString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Verdana-BoldItalic" size:24.f] range:[string rangeOfString:@"Label"]];
    label.numberOfLines = 2;
//   //  段落
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
   label.highlighted = NO;//高亮状态是否打开
    label.userInteractionEnabled = YES;//设置标签是否忽略或移除用户交互。默认为NO
//    label.adjustsFontSizeToFitWidth = YES;
   label.baselineAdjustment = UIBaselineAdjustmentAlignBaselines;//如果adjustsFontSizeToFitWidth属性设置为YES，这个属性就来控制文本基线的行为。
//        UIBaselineAdjustmentAlignBaselines=0，默认，文本最上端与中线对齐。
//        UIBaselineAdjustmentAlignCenters,   文本中线与label中线对齐。
//        UIBaselineAdjustmentNone,  文本最低端与label中线对齐。;
    [self.view addSubview:label];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
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
