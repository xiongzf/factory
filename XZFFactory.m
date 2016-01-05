//
//  XZFFactory.m
//
//  Created by Mac on 15/10/20.
//  Copyright (c) 2015年 熊中福. All rights reserved.
//

#import "XZFFactory.h"

@implementation XZFFactory
+(UIButton *)btnWithFrame:(CGRect)frame
                     type:(UIButtonType)type
                    title:(NSString *)title
                 fontSize:(CGFloat)fontSize
               titleColor:(UIColor *)titleColor
                  bgColor:(UIColor *)bgColor
                   target:(id)target
                 selector:(SEL)sel
                superView:(UIView *)superView
{
    UIButton *btn = [UIButton buttonWithType:type];
    btn.frame = frame;
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    btn.backgroundColor = bgColor;
    [btn addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    [superView addSubview:btn];
    return btn;
}
//创建一个按钮，标题为蓝色，标题大小20，背景绿色，系统按钮类型
+(UIButton *)btnWithFrame:(CGRect)frame
                    title:(NSString *)title
                   target:(id)target
                 selector:(SEL)sel
                superView:(UIView *)superView
{
    return [self btnWithFrame:frame type:UIButtonTypeSystem title:title fontSize:20 titleColor:[UIColor blueColor] bgColor:[UIColor greenColor] target:target selector:sel superView:superView];
    
}

+(UILabel *)labelWithFram:(CGRect)frame
                     text:(NSString *)text
                 fontSize:(CGFloat)fontSize
                textColor:(UIColor *)textcolor
                  bgColor:(UIColor *)bgColor
                    align:(NSTextAlignment)align
                superView:(UIView *)superView
{
    UILabel * label = [[UILabel alloc]initWithFrame:frame];
    label.text = text;
    label.font = [UIFont systemFontOfSize:fontSize];
    label.textColor =textcolor;
    label.backgroundColor = bgColor;
    label.textAlignment = align;
    [superView addSubview: label];
    return label;
}


+(UITextField *)textFieldWithFrame:(CGRect)frame
                               Tag:(int)tag
                           BgColor:(UIColor *)bgColor
                       Placeholder:(NSString *)placeholder
              ClearsOnBeginEditing:(BOOL)cOBE
                   ClearButtonMode:(UITextFieldViewMode)cbm
                      KeyboardType:(UIKeyboardType)kBT
                     ReturnKeyType:(UIReturnKeyType)rKT
                   SecureTextEntry:(BOOL)sTN
                         SuperView:(UIView *)superView
{
    UITextField *field = [[UITextField alloc]initWithFrame:frame];
    field.tag = tag;
    field.backgroundColor = bgColor;
    field.placeholder = placeholder;
    field.clearsOnBeginEditing = cOBE;
    field.clearButtonMode = cbm;
    field.keyboardType = kBT;
    field.returnKeyType = rKT;
    field.secureTextEntry = sTN;
    [superView addSubview:field];
    return field;
}

/*创建一个tag 1000，背景白色 默认键盘所有ASCII码字符 编辑时有清空按钮，按钮模型是whileEditing 的文本域*/
+(UITextField *)textFieldWithFrame:(CGRect)frame
                       Placeholder:(NSString *)placeholder
                     ReturnKeyType:(UIReturnKeyType)rKT
                   SecureTextEntry:(BOOL)sTN
                         SuperView:(UIView *)superView
{
    return [self textFieldWithFrame:frame Tag:1000 BgColor:[UIColor whiteColor] Placeholder:placeholder ClearsOnBeginEditing:YES ClearButtonMode:UITextFieldViewModeWhileEditing KeyboardType:UIKeyboardTypeASCIICapable ReturnKeyType:rKT SecureTextEntry:sTN SuperView:superView];
}


+(void)alertMessage:(NSString *)message present:(id)present
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:nil];
    
    [alert addAction:alertAction];
    [present presentViewController:alert animated:YES completion:nil];
    
}


+(void)alertMessageTwoAction:(NSString *)title andMessage:(NSString *)message andAction:(void(^)(UIAlertAction *action))action present:(id)present
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDestructive handler:nil];
    UIAlertAction *alertAction1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:action];
    [alert addAction:alertAction1];
    [alert addAction:alertAction];
    [present presentViewController:alert animated:YES completion:nil];
}

//在请求前给url编码
+(NSString *)encodeUrlWillRequest:(NSString *)url
{
    NSString *encoded = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    return encoded;
    
}
//在请求前给url解码
+(NSString *)decodeUrlWillRequest:(NSString *)url
{
    NSString *decode = [url stringByRemovingPercentEncoding];
    return decode;
}



@end
