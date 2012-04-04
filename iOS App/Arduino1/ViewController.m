//
//  ViewController.m
//  Arduino1
//
//  Created by Jorge Izquierdo on 3/11/12.
//  Copyright (c) 2012 JIzqApps. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (Private)
    
-(void)sendValueToServer:(NSInteger)integer;

@end

@implementation ViewController

-(IBAction)sliderValueChanged:(UISlider *)sender{
    
    entero = (NSInteger)(sender.value * 255);
    [self sendValueToServer:entero];
    
}
-(IBAction)switchValueChanged:(UISwitch *)sender{

    if (sender.on){

        on = true;
        [self sendValueToServer:entero];
    }
    
    else {

        on = false;
        [self sendValueToServer:0];
    }
}

-(void)sendValueToServer:(NSInteger)integer{
    
    if (on){
        
        NSString *url = [NSString stringWithFormat:@"http://192.168.1.36:8080/value/%d", integer];
        NSLog(@"url: %@", url);
    
        NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    
        [NSURLConnection sendAsynchronousRequest:req queue:nil completionHandler:nil];¡
    }
}


- (void)viewDidLoad
{
    
    on = true;                     
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
