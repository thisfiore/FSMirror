//
//  ViewController.m
//  FSMirror
//
//  Created by Josh Puckett on 8/28/14.
//  Copyright (c) 2014 Josh Puckett. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate, UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
- (IBAction) doubleTapped:(UITapGestureRecognizer *)gesture;
@property (weak, nonatomic) IBOutlet UIButton *refreshBtn;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    for (id subview in self.webView.subviews)
        if ([[subview class] isSubclassOfClass: [UIScrollView class]])
            ((UIScrollView *)subview).bounces = NO;
    [_controlView.layer setCornerRadius:6];
}

-(IBAction)textFieldReturn:(id)sender
{
    NSString *fieldUrl = self.urlField.text;
    NSString *combinedUrl = [NSString stringWithFormat:@"%@%@", @"http://", fieldUrl];
    NSLog(@"%@", combinedUrl);

    int len = (int)[fieldUrl length];
    if (len != 0) {
        [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:combinedUrl]]];
        _controlView.hidden = YES;
    }
    [sender resignFirstResponder];
}

- (IBAction) doubleTapped:(UITapGestureRecognizer *)gesture {
    [_controlView setHidden:!_controlView.hidden];
}

- (IBAction)refreshBtnTapped:(UIButton *)sender {
    [self.webView reload];
    [_controlView setHidden:!_controlView.hidden];
}

- (IBAction)PrototypeMenu:(id)sender {
    
    //CHANGE THIS WITH YOUR IP ADDRESS
    
    NSString *fieldUrl = @"192.168.1.95:8000";
    
    NSString *combinedUrl = [NSString stringWithFormat:@"%@%@", @"http://", fieldUrl];
    NSLog(@"%@", combinedUrl);
    
    int len = (int)[fieldUrl length];
    if (len != 0) {
        [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:combinedUrl]]];
        _controlView.hidden = YES;
    }
    [sender resignFirstResponder];
    
}


- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
