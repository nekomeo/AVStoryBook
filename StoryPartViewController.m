//
//  StoryPartViewController.m
//  AVStorybook
//
//  Created by Elle Ti on 2017-08-11.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

#import "StoryPartViewController.h"
@import AVFoundation;

@interface StoryPartViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *storyImage;
@property (weak, nonatomic) IBOutlet UIButton *cameraButton;
@property (weak, nonatomic) IBOutlet UIButton *microphoneButton;

@property (nonatomic, strong) AVAudioPlayer *player;

@end

@implementation StoryPartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Placeholder image
    self.storyImage.image = [UIImage imageNamed:@"cat"];
    
    [self audioSetup];
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

#pragma mark - Photos
- (IBAction)cameraButton:(UIButton *)sender
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        imagePicker.cameraDevice = UIImagePickerControllerCameraDeviceRear;
    }
    else if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
    {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    imagePicker.delegate = self;
    
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
    // Add the image to the image view
    UIImage *selectedImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    self.storyImage.image = selectedImage;
}

#pragma mark - Audio

- (void)audioSetup
{
    NSString *pathToFile = [[NSBundle mainBundle] resourcePath];
    NSURL *urlToFile = [NSURL URLWithString:[NSString stringWithFormat:@"%@", pathToFile]];
    
    NSError *error = nil;
    
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:urlToFile error:&error];
    
    if (error)
    {
        NSLog(@"Error with audio %@", error.localizedDescription);
    }
    else
    {
        NSLog(@"Success!");
    }
}

- (IBAction)micButton:(UIButton *)sender
{
    [self.player play];
}

#pragma mark - Gestures

- (IBAction)tapGesture:(UITapGestureRecognizer *)sender {
}

@end
