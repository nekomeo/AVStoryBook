//
//  SinglePageViewController.m
//  AVStorybook
//
//  Created by Elle Ti on 2017-08-11.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

#import "SinglePageViewController.h"

@interface SinglePageViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation SinglePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.label.text = [NSString stringWithFormat:@"Page: %i", self.pageNumber];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



@end
