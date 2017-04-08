//
//  ViewController.h
//  HWios
//
//  Created by Frank Klassner on 1/17/13.
//  Copyright (c) 2013 Frank Klassner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UILabel *myGreeting; //pointers, IBOutlet - UI element in storyboards
@property (strong, nonatomic) IBOutlet UILabel *myResponse;
@property (strong, nonatomic) IBOutlet UITextField *myInput;
@property (strong, nonatomic) NSString *userName;
@property (strong, nonatomic) IBOutlet UIButton *myButton;
@property (strong,nonatomic) IBOutlet UISwitch *mySwitch;
@property (strong,nonatomic) IBOutlet UILabel *myHide;
@property (strong,nonatomic) IBOutlet UILabel *myShow;
@property (strong,nonatomic) IBOutlet UIImageView *myImage;

-(IBAction)updateResponse:(id)sender; //method is update response, parameter is sender, IBaction = action accompanied by display object in the storyboard

-(IBAction)updateSwitch:(id)decision;

@end
