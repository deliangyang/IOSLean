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
    
    NSArray *tableData;
    
    UITableView *_tableView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    
    tableData = [NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini", nil];

    
    [super viewDidLoad];
    [self addTableView];
    //[self addButton];
    //[self addSlider];
    //[self addsliderLabel];
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

- (void)addTableView {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(20, 20, 300, 300)
                                              style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"hello worold2");
    return tableData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"TTTT";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:identifier];
    }
    cell.textLabel.text = tableData[indexPath.row];
    cell.textLabel.numberOfLines = 0;
    
    return cell;
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
