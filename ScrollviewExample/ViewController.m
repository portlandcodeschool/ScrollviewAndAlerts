//
//  ViewController.m
//  ScrollviewExample
//
//  Created by Erick Bennett on 1/4/15.
//  Copyright (c) 2015 Erick Bennett. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //Programmaticaly create a UIScrollview
    UIScrollView *scroller = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 80)];

    //Set its background color to blue
    scroller.backgroundColor = [UIColor blueColor];
    
    //Using the autoresizing mask options, tell this view to automatically resize height and width when switching between landscape and portrait
    scroller.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;

    //Add the new UIScrollView to the main view for display
    [self.view addSubview:scroller];

    
    //We want to add 20 labels to our view, each a few pixels below the previously add label.
    for (int y = 0; y < 20; y++) {
        
        //Create a UILabel, use the y position in our for loop to determine the y origin placement of this label
        UILabel *aLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 40 * y, self.view.frame.size.width, 30)];
        
        //Set its background color to red
        aLabel.backgroundColor = [UIColor redColor];
        
        //Set the text o display for this label. Use the y integer in our for loop to show which label number it is.
        aLabel.text = [NSString stringWithFormat:@"This is Label #%i", y];
        
        //Set our label to automaticaly adjust its size within the scrollview
        aLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        
        //Add this label to our scroller
        [scroller addSubview:aLabel];
        
        //Set our scrollviews content frame by using y origin + label height
        scroller.contentSize = CGSizeMake(100, aLabel.frame.origin.y + aLabel.frame.size.height);
        
        //For loop will now repeat, creating another label below this one. This happens 20 times.
        
    }

}

- (IBAction)showAlertView:(id)sender {
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0){
        UIAlertView *uav = [[UIAlertView alloc] initWithTitle:@"Alert view" message:@"This is an alertview in iOS7" delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:@"OK", nil];
        [uav show];
        
    } else {
        //Create the controller
        UIAlertController *controller = [UIAlertController alertControllerWithTitle: @"Alert sheet"
                                                    message: @"This is a test of an AlertController using the Alert sheet style"
                                                    preferredStyle: UIAlertControllerStyleAlert];
        //Create an action with completion handler
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle: @"OK"
                                                              style: UIAlertActionStyleDefault
                                                            handler: ^(UIAlertAction *action) {
                                                                //This completion handler runs when this button is tapped. A delegate is  not used here
                                                                NSLog(@"Alert Action pressed");
                                                            }];
        //Create an action with completion handler
        UIAlertAction *dismissAction = [UIAlertAction actionWithTitle: @"Dismiss"
                                                              style: UIAlertActionStyleDestructive
                                                            handler: ^(UIAlertAction *action) {
                                                                //This completion handler runs when this button is tapped. A delegate is  not used here
                                                                NSLog(@"Alert sheet dismissed");
                                                            }];
        
        //Add the action to the controller
        [controller addAction: alertAction];
        [controller addAction: dismissAction];

        [self presentViewController: controller animated: YES completion: nil];
    }
}
- (IBAction)showActionSheet:(id)sender {
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0){
        UIActionSheet *uas = [[UIActionSheet alloc] initWithTitle:@"Action sheet" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Dismiss" otherButtonTitles:@"OK", nil];
        [uas showInView:self.view];
        
    } else {
        //Create the controller
        UIAlertController *controller = [UIAlertController alertControllerWithTitle: @"Action Sheet!"
                                                        message: @"This is a test of an AlertController using the Action sheet style"
                                                        preferredStyle: UIAlertControllerStyleActionSheet];
        //Create an action with completion handler
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle: @"OK"
                                                              style: UIAlertActionStyleDefault
                                                            handler: ^(UIAlertAction *action) {
                                                                //This completion handler runs when this button is tapped. A delegate is  not used here
                                                                NSLog(@"Alert Action pressed");
                                                            }];
        //Create an action with completion handler
        UIAlertAction *dismissAction = [UIAlertAction actionWithTitle: @"Dismiss"
                                                                style: UIAlertActionStyleDestructive
                                                              handler: ^(UIAlertAction *action) {
                                                                  //This completion handler runs when this button is tapped. A delegate is  not used here
                                                                  NSLog(@"Alert sheet dismissed");
                                                              }];
        
        //Add the action to the controller
        [controller addAction: alertAction];
        [controller addAction: dismissAction];
        
        [self presentViewController: controller animated: YES completion: nil];
    }
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    NSLog(@"iOS 7 or below AlertView Index pressed = %li", (long)buttonIndex);
}

-(void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
    NSLog(@"iOS 7 or below ActionSheet Index pressed = %li", (long)buttonIndex);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
