//
//  PageViewController.m
//  AVStorybook
//
//  Created by Elle Ti on 2017-08-11.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

#import "PageViewController.h"
//#import "SinglePageViewController.h"
#import "StoryPartViewController.h"

@interface PageViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@end

@implementation PageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSource = self;
    
//    SinglePageViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"single-page-view-controller"];
    StoryPartViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"story-part-view-controller"];
    viewController.pageNumber = 1;
    [self setViewControllers:@[viewController] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
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

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    int previousPageNumber = ((StoryPartViewController *)viewController).pageNumber;
    if (previousPageNumber == 1)
    {
        return nil;
    }
    
//    SinglePageViewController *nextPageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"single-page-view-controller"];
    StoryPartViewController *nextPageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"story-part-view-controller"];
    
    nextPageViewController.pageNumber = previousPageNumber-1;
    return nextPageViewController;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    int previousPageNumber = ((StoryPartViewController *)viewController).pageNumber;
    if (previousPageNumber == 5)
    {
        return nil;
    }
//    SinglePageViewController *nextPageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"single-page-view-controller"];
    StoryPartViewController *nextPageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"story-part-view-controller"];
    nextPageViewController.pageNumber = previousPageNumber+1;
    return nextPageViewController;
}

@end
