# iOSClassNotes
网上找的iOS课堂笔记
MVC模式：（model + view controller）:是一种帮你把代码功能和显示划分出来的设计模式；
model:较为底层的数据引擎，负责管理实体中所继承的数据
view：和用户交互界面
controller： 链接二者的桥梁
cocoa  frameworks 有两个框架
foundation
foundation 是cocoa中最基本的一些雷；在Mac应用程序中负责对象管理，内存管理，容器等相关数据；
UIKit
UIKit： 为程序提供可视化的底层架构，包括 窗口、视图、控件类和管理这些对象的控制器，这一层中的其它框架允许你访问用户联系人和图片信息，以及设备上的加速器和其它硬件特征

创建iOS项目
1、 xcode -> ios -> application -> single View application
2.UIViewController:视图控制器 ,通过点击，触摸来控制程序
3.view: 视图 UIView 指所有可视控件
4.在项目中创建一个文件。
RootViewCotroller *rvc=[[RootViewCotroller alloc]initWithNibName:@"RootViewCotroller" bundle:nil];  
    self.window.rootViewController=rvc;  
    [rvc release];  
  代码含义：创建根控件,并把新创建的根控件赋值给窗口的根控件；注意释放；
5.属性
atomic: 原子操作；线程保护；就是在几个线程中调用同一段内容时导致所用内容混乱，进行枷锁机制
nonatomic: 不加锁机制，提高效率
5.label 控件
初始化
UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10,10,10,10)];
赋值
label.text = @"啦啦啦啦阿拉";
字体 （默认17）
[label setFont:[UIFont systemFontOfSize:20]];
字体颜色 （default black）
label.textColor = [UIColor redColor];
设置阴影颜色
label.shadowColor = [UIIColor blackColor];
设置阴影位置 相对字体的位置 （default （0，－1））
label.shadowOffset = CGSizeMake(-2,-2);
设置字体的对齐方式；(default NSTextAlignmentLeft)
label.textAlignment = NSTextAlignmentCenter;
   enum {
       NSTextAlignmentLeft      = 0,  左对齐，默认
        NSTextAlignmentCenter    = 1,  居中对齐
        NSTextAlignmentRight     = 2,  右对齐
        NSTextAlignmentJustified = 3,  在一个段落的最后一行自然对齐
        NSTextAlignmentNatural   = 4,  默认对齐方式
    } NSTextAlignment;
文本自动折行方式 
label.lineBreakModel = NSLineBreakByTruncatingTail ;(default)
    enum {
       NSLineBreakByWordWrapping = 0,  以单词为显示单位显示，后面部分省略不显示，默认
       NSLineBreakByCharWrapping,      以字符为显示单位显示，后面部分省略不显示
        NSLineBreakByClipping,          剪切与文本宽度相同的内容长度，后半部分被删除
        NSLineBreakByTruncatingHead,    开头省略，显示尾部文字内容
        NSLineBreakByTruncatingTail,    结尾省略，显示开头的文字内容
        NSLineBreakByTruncatingMiddle   中间省略，显示头尾的文字内容
    } NSLineBreakMode;
  富文本的基本数据类型，属性字符串。以此为基础，如果这个设置了相应的属性，则会忽略上面设置的属性，默认为空
  
