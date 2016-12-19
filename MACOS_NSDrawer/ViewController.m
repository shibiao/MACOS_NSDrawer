//
//  ViewController.m
//  MACOS_NSDrawer
//
//  Created by sycf_ios on 2016/12/19.
//  Copyright © 2016年 sycf_ios. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController{
    NSDrawer *_drawer;
    NSView *_yellowView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _yellowView = [[NSView alloc]init];
    _yellowView.wantsLayer = YES;
    _yellowView.layer.backgroundColor = [NSColor yellowColor].CGColor;
    
    
}
- (IBAction)up:(id)sender {
    if (!_drawer) {
        [self createDrawer];
        [_drawer openOnEdge:NSRectEdgeMaxY];
    }else{
        [_drawer close];
    }
    
}
- (IBAction)left:(NSButton *)sender {
    if (!_drawer) {
        [self createDrawer];
        [_drawer openOnEdge:NSRectEdgeMinX];
    }else{
        [_drawer close];
    }
    
}
- (IBAction)down:(id)sender {
    if (!_drawer) {
        [self createDrawer];
        [_drawer openOnEdge:NSRectEdgeMinY];
    }else{
        [_drawer close];
    }
}
- (IBAction)right:(id)sender {
    if (!_drawer) {
        [self createDrawer];
        [_drawer openOnEdge:NSRectEdgeMaxX];
    }else{
        [_drawer close];
    }
}
-(void)createDrawer{
    _drawer = [[NSDrawer alloc]initWithContentSize:NSMakeSize(200, 200) preferredEdge:NSRectEdgeMinX];
    _drawer.delegate = self;
    _drawer.contentView = _yellowView;
    _drawer.parentWindow = self.view.window;
    _drawer.leadingOffset = 0.f;
    _drawer.trailingOffset = 0.f;
    _drawer.minContentSize = NSMakeSize(100, 100);
    _drawer.maxContentSize = NSMakeSize(300, 300);
}
- (void)drawerDidClose:(NSNotification *)notification{
    _drawer = nil;
}
- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

@end
