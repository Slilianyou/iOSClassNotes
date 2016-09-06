# iOSClassNotes
网上找的iOS课堂笔记
MVC模式：（model + view controller）:是一种帮你把代码功能和显示划分出来的设计模式</br>
model:较为底层的数据引擎，负责管理实体中所继承的数据</br>
view：和用户交互界面</br>
controller： 链接二者的桥梁</br>
cocoa  frameworks 有两个框架</br>
foundation</br>
foundation 是cocoa中最基本的一些雷；在Mac应用程序中负责对象管理，内存管理，容器等相关数据；</br>
UIKit</br>
UIKit： 为程序提供可视化的底层架构，包括</br> 窗口、视图、控件类和管理这些对象的控制器，这一层中的其它框架允许你访问用户联系人和图片信息，以及设备上的加速器和其它硬件特征</br>

创建iOS项目</br>
1、 xcode -> ios -> application -> single View application</br>
2.UIViewController:视图控制器 ,通过点击，触摸来控制程序</br>
3.view: 视图 UIView 指所有可视控件</br>
4.在项目中创建一个文件。</br>
RootViewCotroller *rvc=[[RootViewCotroller alloc]initWithNibName:@"RootViewCotroller" bundle:nil];  </br>
self.window.rootViewController=rvc;  </br>
[rvc release];  </br>
代码含义：创建根控件,并把新创建的根控件赋值给窗口的根控件；注意释放；</br>

5.属性</br>
atomic: 原子操作；线程保护；就是在几个线程中调用同一段内容时导致所用内容混乱，进行枷锁机制</br>
nonatomic: 不加锁机制，提高效率</br>

5.label 控件</br>
初始化</br>
UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10,10,10,10)];</br>
赋值</br>
label.text = @"啦啦啦啦阿拉";</br>
字体 （默认17）</br>
[label setFont:[UIFont systemFontOfSize:20]];</br>
字体颜色 （default black）</br>
label.textColor = [UIColor redColor];</br>
设置阴影颜色</br>
label.shadowColor = [UIIColor blackColor];</br>
设置阴影位置 相对字体的位置 （default （0，－1））</br>
label.shadowOffset = CGSizeMake(-2,-2);</br>
设置字体的对齐方式；(default NSTextAlignmentLeft)</br>
label.textAlignment = NSTextAlignmentCenter;</br>
   enum {</br>
       NSTextAlignmentLeft      = 0,  左对齐，默认</br>
        NSTextAlignmentCenter    = 1,  居中对齐</br>
        NSTextAlignmentRight     = 2,  右对齐</br>
        NSTextAlignmentJustified = 3,  在一个段落的最后一行自然对齐</br>
        NSTextAlignmentNatural   = 4,  默认对齐方式</br>
    } NSTextAlignment;</br>
文本自动折行方式 </br>
label.lineBreakModel = NSLineBreakByTruncatingTail ;(default)</br>
    enum {</br>
       NSLineBreakByWordWrapping = 0,  以单词为显示单位显示，后面部分省略不显示，默认</br>
       NSLineBreakByCharWrapping,      以字符为显示单位显示，后面部分省略不显示</br>
        NSLineBreakByClipping,          剪切与文本宽度相同的内容长度，后半部分被删除</br>
        NSLineBreakByTruncatingHead,    开头省略，显示尾部文字内容</br>
        NSLineBreakByTruncatingTail,    结尾省略，显示开头的文字内容</br>
        NSLineBreakByTruncatingMiddle   中间省略，显示头尾的文字内容</br>
    } NSLineBreakMode;</br>
富文本的基本数据类型，属性字符串。以此为基础，如果这个设置了相应的属性，则会忽略上面设置的属性，默认为空</br>
NSAttributeString 如程序中描述的</br>
设置文本高亮显示颜色，与highlighted一起使用</br>
label.highlightedTextColor = [UIColor redColor];</br>
高亮状态是否打开</br>
label.highlighted = YES;</br>
设置标签是否忽略或移除用户交互。默认为NO </br> 
label.userInteractionEnabled = YES;</br>
标签的文字是否可变 (default  YES)</br>
label.enabled = YES;</br>
标签的显示行数 (default 0 没有限制)</br>
label.numberOflines = 0;</br>
根据UILabel的宽度来自动适应字体大小，但要注意的是，这个属性不会让字体变大，只会缩小，所以开始的时候，可以设置字体fontSize大一点。
label.adjustsFontSizeToFitWidth = YES;</br>
有时候我们需要UIlabel根据字数多少来减小字体大小，使得UIlabel能够显示全所有的文字</br>。你需要做的就是设置minimumScaleFactor。minimumScaleFactor默认值是0，此时最小字体就是设置的字体大小，和1的效果一样。</br>
因此 </br>
1、0<minimumScaleFactor<1时才能达到效果。（字体10，想要最小字体5，设置0.5即可）</br>
2、另外要设置adjustsFontSizeToFitWidth=YES.</br>
3、还有需要UIlabel的行数是1的时候才有用,多行的label是不行的</br>
 label.minimumScaleFactor = 0.3;</br>
baselineAdjustment这个值控制文本的基线位置，只有文本行数为1是有效</br>
label.baselineAdjustment = UIBaselineAdjustmentAlignBaselines;</br>
//如果adjustsFontSizeToFitWidth属性设置为YES，这个属性就来控制文本基线的行为。</br>
//UIBaselineAdjustmentAlignBaselines=0，默认，文本最上端与中线对齐。</br>
//UIBaselineAdjustmentAlignCenters,   文本中线与label中线对齐。</br>
//UIBaselineAdjustmentNone,  文本最低端与label中线对齐。</br>
allowsDefaultTighteningForTruncation//iOS 9 新加的,默认是False,设置true  会让字体之间更紧凑一些</br>
label0.allowsDefaultTighteningForTruncation = false</br>
绘制text到指定区域 //需要重载此方法，然后由子类调用，重写时调用super可以按默认图形属性绘制,若自己完全重写绘制函数,就不用调用super了</br>
<b>- (void)drawTextInRect:(CGRect)rect;</b></br>
计算Label随字体多行后的高度</br>
<b>- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines;</b></br>
preferredMaxLayoutWidth</br>
这个属性是用来设置多行label的最大宽度的</br>
当自动布局的时候约束这个label的时候这个属性会起作用</br>
在自动布局添加约束中，若文本超过了指定的最大宽度的时候 文本会另起一行 从而增加了label的高度</br>
label.preferredMaxLayoutWidth = 20;</br>
label多行后的高度</br>
CGRect result,bounds;</br>
bounds = CGRectMake(0, 0,200, 300);</br>
heightLabel = [myLabel textRectForBounds:bounds limitedToNumberOfLines:20];//计算20行后的Label的Frame</br>
NSLog(@"%f",heightLabel.size.height);//计算20行后的Label的Frame
