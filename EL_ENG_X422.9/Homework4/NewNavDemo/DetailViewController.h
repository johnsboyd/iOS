//
//  DetailViewController.h
//  navDemo
//
//

#import <UIKit/UIKit.h>
#import "MyDrawingView.h"
//import the header for your drawingview
// HW4 - Define your drawing view as an instance variable

@interface DetailViewController : UIViewController

//XXXXX
//declare your drawing view
@property (nonatomic, strong) MyDrawingView *myDrawingView;

@end
