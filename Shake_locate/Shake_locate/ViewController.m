//
//  ViewController.m
//  Shake_locate
//
//  Created by student1 on 2/20/16.
//  Copyright © 2016 student1. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController
@synthesize label;
@synthesize longitudeLabel;
@synthesize latitudeLabel;
@synthesize factLabel;
CLLocationManager *locationManager;


//set first responder
-(BOOL) canBecomeFirstResponder {
    return YES;
}

-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event{
   if (event.subtype == UIEventSubtypeMotionShake)
   {
       //start location services
       [self startStandardUpdates];
   }
}



//check if location services are enabled
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(nonnull NSError *)error {
    NSLog(@"didFailwithError: %@", error);
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(nonnull NSArray<CLLocation *> *)locations {
    
    NSLog(@"Made it to didUpdateLocations");
    
    //current longitude & latitude coordinates
    double latitude = locationManager.location.coordinate.latitude;
    double longitude = locationManager.location.coordinate.longitude;
    
    //change of labels to display current location
    latitudeLabel.text = [NSString stringWithFormat:@"%.8f",latitude];
    longitudeLabel.text = [NSString stringWithFormat:@"%.8f", longitude];
    
    //Fact Strings
    NSString *ceer = @"You are closest to CEER. Villanova's School of Engineering is ranked in the top 15 in the country by US News & World Report.";
    NSString *bartley =@"You are closest to Bartley. In 2022, the Villanova School of Business will be 100 years old.";
    NSString *mendel = @"You are closest to Mendel. On the 4th floor of Mendel Science Center is the Observatory that is equiped with three 14ft. telescopes.";
    NSString *falvey = @"You are closest to Falvey Memorial Library which receives over 600,000 visits each year.";
    NSString *offCampus = @"You are out of range of any building and may be off campus, find either ceer, bartley, mendel, or falvey on campus for a fun fact.";
    
    //Locations for all the buildings on Villanova's campus and current location
    CLLocation *current = [[CLLocation alloc] initWithLatitude:latitude longitude:longitude];
    CLLocation *locationCeer = [[CLLocation alloc] initWithLatitude:40.0366404 longitude:-75.3457346];
    CLLocation *locationBartley = [[CLLocation alloc] initWithLatitude:40.0345950 longitude:-75.3383853];
    CLLocation *locationMendel = [[CLLocation alloc] initWithLatitude:40.0378151 longitude:-75.3419795];
    CLLocation *locationFalvey = [[CLLocation alloc] initWithLatitude:40.0374690 longitude:-75.3425460];
    
    //Calculate distance from the current location to each building
    CLLocationDistance distanceCeer = [locationCeer distanceFromLocation:current];
    CLLocationDistance distanceBartley = [locationBartley distanceFromLocation:current];
    CLLocationDistance distanceMendel = [locationMendel distanceFromLocation:current];
    CLLocationDistance distanceFalvey = [locationFalvey distanceFromLocation:current];
    
    //Comparison statements to determine what fact should appear depending on the distance to the buildings
    //The CLLocationDistance class converts degrees distance to meters, 60.96 meters is equivalent to 200 feet
    if (distanceCeer <= 60.96) {
        NSLog(@"Fact should appear for CEER");
        factLabel.text = ceer;
    }
    else if (distanceBartley <= 60.96) {
        NSLog(@"Fact should appear for Bartley");
        factLabel.text = bartley;
    }
    else if (distanceMendel <= 60.96){
        NSLog(@"Fact should appear for Mendel");
        factLabel.text = mendel;
    }
    else if (distanceFalvey <= 60.96) {
        NSLog(@"Fact should appear for Falvey");
        factLabel.text = falvey;
    }
    else {
        NSLog(@"Off Campus message should appear");
        factLabel.text = offCampus;
    }
    
}

-(void)startStandardUpdates {
    
    if ([CLLocationManager locationServicesEnabled])
    {
        NSLog(@"made it inside startStandardUpdates");
        
        if(locationManager == nil)
        {
            locationManager = [[CLLocationManager alloc] init];
        }
        
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        locationManager.distanceFilter = 500; //meters
        
        [locationManager requestWhenInUseAuthorization];
        [locationManager startMonitoringSignificantLocationChanges];
        [locationManager startUpdatingLocation];

    }
}

-(void) viewDidAppear:(BOOL)animated {
    [self becomeFirstResponder];
    [super viewDidAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    }

-(void)viewWillDisappear:(BOOL)animated {
    [self resignFirstResponder];
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
