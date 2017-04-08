//
//  ViewController.h
//  Shake_locate
//
//  Created by student1 on 2/20/16.
//  Copyright © 2016 student1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate>
@property (weak,nonatomic)IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (weak,nonatomic)IBOutlet UILabel *longitudeLabel;
@property (weak,nonatomic) IBOutlet UILabel *factLabel;

    
@end

