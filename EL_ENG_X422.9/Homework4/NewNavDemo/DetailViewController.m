//
//  DetailViewController.m
//  navDemo
//
//

#import "DetailViewController.h"
// HOMEWORK4 Add code in DetailViewController.m / viewDidLoad to alloc/init
// your drawing view and add it as a subview of the view controller's view.


@implementation DetailViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    CGRect thisViewRect = self.view.frame;
    CGRect mainScreenFrame = [[UIScreen mainScreen] bounds];
    //this accounts for the status bar, if it appears
    CGRect mainScreenAppFrame = [[UIScreen mainScreen] applicationFrame];
  
    //XXXXX
    //Here you will insert code to alloc/init your drawing view and install it
    //as a subview of this view controller's view. Remember to import its header file.
    _myDrawingView = [[MyDrawingView alloc] initWithFrame:mainScreenAppFrame];
    [self.view addSubview:self.myDrawingView];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}


- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Drawing view", @"");
    }
    return self;
}
							

@end
