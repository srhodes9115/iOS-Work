//
//  ViewController.m
//  HWios
//
//  Created by Frank Klassner on 1/17/13.
//  Copyright (c) 2013 Frank Klassner. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize myGreeting;
@synthesize myResponse;
@synthesize myInput; //@synthesize will auto generate getter/setters
@synthesize userName;
@synthesize myButton;
@synthesize myHide;
@synthesize myShow;
@synthesize myImage;
@synthesize mySwitch;

- (IBAction)updateResponse:(id)sender {
	// Store the text of the text field in the 'string' instance variable.
	self.userName = myInput.text;
    // Set the text of the label to the value of the 'string' instance variable.
	myResponse.text = [NSString stringWithFormat:@"Hello %@!",self.userName];
}


-(IBAction)updateSwitch:(id)decision {
    
    if(self.mySwitch.on)
    {
        self.myImage.hidden=NO;
    }
    else {
        self.myImage.hidden = YES;
    }
}

s

-(BOOL)textFieldShouldReturn:(UITextField *)theTextField {
	// When the user presses return, take focus away from the text field so that the keyboard is dismissed.
	if(myInput == theTextField) {
		[theTextField resignFirstResponder];
        // Invoke the method that activates the button.
        myButton.enabled = YES; //yes is the same as true
        myButton.hidden = NO; //no is false
	}
	return YES;
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // Dismiss the keyboard when the view outside the text field is touched.
    //In this case we'll abandon the content of the textfield.
    if ([myInput isFirstResponder]) {
        [myInput resignFirstResponder];
        // Revert the text field to empty value.
        myInput.text = @"";
        myInput.placeholder = @"TYPE YOUR FIRST NAME.";
        [myButton setEnabled:NO];
        [myButton setHidden:YES];
    }
    [super touchesBegan:touches withEvent:event];
}


- (void)viewDidUnLoad
{
    // Do any additional takedown after unloading the view.
    [self setMyInput:nil];
    [self setMyResponse:nil];
    [self setUserName:nil];
    [self setMyButton:nil];
}


- (void)viewDidLoad
{
    //	When the user starts typing, show the clear button in the text field.
	myInput.clearButtonMode = UITextFieldViewModeWhileEditing;
    // When the view first loads, display one blank space.
	myResponse.text = @"";
	self.userName = @"???";
    myButton.enabled = NO;
    myButton.hidden = YES;
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end