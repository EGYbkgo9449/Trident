//
//  ViewController.m
//  Trident
//
//  Created by Benjamin Randazzo on 06/11/2016.
//  Copyright © 2016 Benjamin Randazzo. All rights reserved.
//

#import "ViewController.h"

#import "exploit.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *button;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *version = nil;
    
#ifdef TARGET_IPAD_3_1_IOS_9_3_4
    version = @"9.3.4, iPad3,1";
#endif
    
#ifdef TARGET_IPHONE_5_2_IOS_9_2_1
    version = @"9.2.1, iPhone5,2";
#endif

#ifdef TARGET_IPHONE_4_1_IOS_9_3_1
	version = @"9.3.1, iPhone4,1";
#endif
	
#ifdef TARGET_IPAD_2_X_IOS_9_3_2
	version = @"9.3.2, iPad2,X";
#endif
	
#ifdef TARGET_IPHONE_52_53_IOS_9_3_2
	version = @"9.3.2, iPhone5,2/5,3";
#endif
	
    self.label.text = [NSString stringWithFormat:@"by benjamin, for iOS %@", version];
}

- (IBAction)start:(id)sender {
    initialize();
    uint32_t kernel_base = leak_kernel_base();
    printf("kernel base: %p\n", (void *)kernel_base);
    exploit(kernel_base);
    
    // Update button.
    self.button.enabled = NO;
    [self.button setTitle:@"w00t root" forState:UIControlStateNormal];
}

@end
