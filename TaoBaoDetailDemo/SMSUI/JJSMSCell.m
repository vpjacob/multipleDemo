//
//  JJSMSCell.m
//  TaoBaoDetailDemo
//
//  Created by vpjacob on 2017/6/9.
//  Copyright © 2017年 vpjacob. All rights reserved.
//

#import "JJSMSCell.h"
#import <SMS_SDK/SMSSDK.h>

@interface JJSMSCell ()

@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
@property (weak, nonatomic) IBOutlet UITextField *pswTF;
@property (weak, nonatomic) IBOutlet UILabel *mesageLabel;


@end

@implementation JJSMSCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (IBAction)commitPhoneClick:(id)sender {
    __weak typeof(self) weakSF = self;
    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:self.phoneTF.text zone:@"86" customIdentifier:nil result:^(NSError *error){
                                     if (!error) {
                                         NSLog(@"获取验证码成功");
                                         weakSF.mesageLabel.text = @"验证成功";
                                     } else {
                                         NSLog(@"错误信息：%@",error);
                                         weakSF.mesageLabel.text = [NSString stringWithFormat:@"错误信息:%@",error];
                                     }
    }];
                                     
}
- (IBAction)commitPwdClick:(id)sender {
    __weak typeof(self) weakSF = self;
    [SMSSDK commitVerificationCode:self.pswTF.text phoneNumber:self.phoneTF.text zone:@"86"  result:^(SMSSDKUserInfo *userInfo, NSError *error) {
        {
            if (!error)
            {
                
                NSLog(@"验证成功");
                weakSF.mesageLabel.text = @"验证成功";
            
            }
            else
            {
                NSLog(@"错误信息:%@",error);
                weakSF.mesageLabel.text = [NSString stringWithFormat:@"错误信息:%@",error];
            }
        }
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
