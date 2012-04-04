//
//  ViewController.h
//  Arduino1
//
//  Created by Jorge Izquierdo on 3/11/12.
//  Copyright (c) 2012 JIzqApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    
    NSInteger entero;

    BOOL on;
}
-(IBAction)sliderValueChanged:(UISlider *)sender;
-(IBAction)switchValueChanged:(UISwitch *)sender;


@end
