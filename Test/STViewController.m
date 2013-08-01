//
//  STViewController.m
//  Test
//
//  Created by stcui on 13-8-1.
//  Copyright (c) 2013年 stcui. All rights reserved.
//

#import "STViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface STViewController ()

@end

@implementation STViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100 ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * const identifier = @"cell";
    const NSInteger subviewTag = 10;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        UIView *view = [[UIView alloc] initWithFrame:cell.contentView.bounds];
        view.tag = subviewTag;
        view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        [cell.contentView addSubview:view];

        UIView *dot = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
        dot.clipsToBounds = YES;
        dot.backgroundColor = [UIColor cyanColor];
        dot.layer.cornerRadius = 10;
        [cell.contentView addSubview:dot];
    }
    
    UIView *view = [cell.contentView viewWithTag:subviewTag];
    NSInteger factor = 2*(indexPath.row + 1);
    
    view.backgroundColor = [UIColor colorWithRed:sinf(M_PI/12 + M_PI/factor)
                                           green:sinf(M_PI/6 + M_PI/factor)
                                            blue:sinf(M_PI/4 + M_PI/factor)
                                           alpha:1];

    return cell;
}

@end
