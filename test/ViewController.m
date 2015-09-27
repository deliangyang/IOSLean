//
//  ViewController.m
//  test
//
//  Created by yangdeliang on 9/27/15.
//  Copyright © 2015 yangdeliang. All rights reserved.
//

#import "ViewController.h"

// 实现
@interface ViewController () {

    UILabel *sliderLl;
    UISlider *slider;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self addButton];
    [self addSlider];
    [self addsliderLabel];
//    Do any additional setup after loading the view, typically from a nib.
//    NSString *path = [[NSBundle mainBundle] resourcePath];
//    NSLog(@"%@", path);
//    NSString *imagePath = [NSString stringWithFormat:@"%@/a.png", path];
//    UIImage *image = [[UIImage alloc]initWithContentsOfFile:imagePath];
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
//    imageView.frame = CGRectMake(0, 0, 300, 300);
//    imageView.backgroundColor = [UIColor greenColor];
//    
//    [self.view addSubview:imageView];
    
}

- (void)addsliderLabel {
    sliderLl = [[UILabel alloc] initWithFrame:CGRectMake(100, 150, 40, 30)];
    sliderLl.backgroundColor = [UIColor greenColor];
    

    [self.view addSubview:sliderLl];
}

- (void)addSlider {
    slider = [[UISlider alloc] initWithFrame:CGRectMake(40, 40, 110, 20)];
    slider.backgroundColor = [UIColor yellowColor];
    slider.value = .7f;
    slider.minimumValue = 0.0f;
    slider.maximumValue = 1.0f;
    
    // add event
    [slider addTarget:self
               action:@selector(sliderValueChange:)
     forControlEvents:UIControlEventValueChanged];
    
    [slider addTarget:self
               action:@selector(sliderDragUp:)
     forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:slider];
}

- (IBAction)sliderValueChange:(id)sender {
    NSLog(@"value changer");
    sliderLl.text = [NSString stringWithFormat:@"%.2f", slider.value];
}


- (IBAction)sliderDragUp:(id)sender {
    NSLog(@"drag up");
}

- (void)addButton {
    CGRect frame = CGRectMake(100, 200, 100, 30);
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    // button raiuds
    [button.layer setCornerRadius:4.0f];
    button.frame = frame;
    // set title
    [button setTitle:@"动态添加按钮" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor blueColor];
    button.tag = 200;
    // set action
    [button addTarget:self
               action:@selector(buttonClick:)
     forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}

- (IBAction)buttonClick:(id)sender {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"My Alert"
                                                                   message:@"This is an alert."
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
