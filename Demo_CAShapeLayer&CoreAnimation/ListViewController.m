//
//  ListViewController.m
//  Demo_CAShapeLayer&CoreAnimation
//
//  Created by 吴珂 on 2018/1/11.
//  Copyright © 2018年 世纪阳天. All rights reserved.

#import "ListViewController.h"

@interface ListViewController ()

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    cell.textLabel.text = [self viewControllerName:indexPath];;
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *vcName = [self viewControllerName:indexPath];
    Class vcClass = NSClassFromString(vcName);
    UIViewController *vc = [[vcClass alloc] init];
    
    if (vc) {
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (NSString *)viewControllerName:(NSIndexPath *)indexPath
{
    return [NSString stringWithFormat:@"ViewController%li", indexPath.row + 1];
}


@end
