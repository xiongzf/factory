//
//  XZFFactory.h
//
//  Created by Mac on 15/10/20.
//  Copyright (c) 2015年 熊中福. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface XZFFactory : NSObject
//创建一个按钮
+(UIButton *)btnWithFrame:(CGRect)frame
                     type:(UIButtonType)type
                    title:(NSString *)title
                 fontSize:(CGFloat)fontSize
               titleColor:(UIColor *)titleColor
                  bgColor:(UIColor *)bgColor
                   target:(id)target
                 selector:(SEL)sel
                superView:(UIView *)superView;

//创建一个按钮，标题为蓝色，标题大小20，背景绿色，系统按钮类型
+(UIButton *)btnWithFrame:(CGRect)frame
                    title:(NSString *)title
                   target:(id)target
                 selector:(SEL)sel
                superView:(UIView *)superView;
//创建一个label
+(UILabel *)labelWithFram:(CGRect)frame
                     text:(NSString *)text
                 fontSize:(CGFloat)fontSize
                textColor:(UIColor *)textcolor
                  bgColor:(UIColor *)bgColor
                    align:(NSTextAlignment)align
                superView:(UIView *)superView;
//创建一个文本框
+(UITextField *)textFieldWithFrame:(CGRect)frame
                               Tag:(int)tag
                           BgColor:(UIColor *)bgColor
                       Placeholder:(NSString *)placeholder
              ClearsOnBeginEditing:(BOOL)cOBE
                   ClearButtonMode:(UITextFieldViewMode)cbm
                      KeyboardType:(UIKeyboardType)kBT
                     ReturnKeyType:(UIReturnKeyType)rKT
                   SecureTextEntry:(BOOL)sTN
                         SuperView:(UIView *)superView;

/*创建一个tag 1000，背景白色 默认键盘所有ASCII码字符 编辑时有清空按钮，按钮模型是whileEditing 的文本框*/
+(UITextField *)textFieldWithFrame:(CGRect)frame
                       Placeholder:(NSString *)placeholder
                     ReturnKeyType:(UIReturnKeyType)rKT
                   SecureTextEntry:(BOOL)sTN
                         SuperView:(UIView *)superView;
//弹出一个提示框
+(void)alertMessage:(NSString *)message present:(id)present;

//弹出一个提示框,点击相关按钮之后,进行对应操作
+(void)alertMessageTwoAction:(NSString *)title andMessage:(NSString *)message andAction:(void(^)(UIAlertAction *action))action present:(id)present;


//在请求前给url编码
+(NSString *)encodeUrlWillRequest:(NSString *)url;

//在请求前给url解码
+(NSString *)decodeUrlWillRequest:(NSString *)url;




@end
