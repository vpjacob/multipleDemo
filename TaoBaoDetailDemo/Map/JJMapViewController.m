//
//  JJMapViewController.m
//  TaoBaoDetailDemo
//
//  Created by vpjacob on 2017/6/9.
//  Copyright © 2017年 vpjacob. All rights reserved.
//

#import "JJMapViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface JJMapViewController ()

@property (nonatomic, strong)MKMapView *mapView;
@property (nonatomic, strong)CLLocationManager *managerL;
@property (nonatomic, strong)CLLocation *location;
@property (nonatomic, strong)UISegmentedControl *segemtControl;
@end

@implementation JJMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.mapView];
    [self.view addSubview:self.segemtControl];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Action
- (void)segmentAction{
    NSInteger index = self.segemtControl.selectedSegmentIndex;
    if (index == 0) {
//        CLLocation *location = 
//        CLLocationCoordinate2D coor = CLLocationCoordinate2DMake(, <#CLLocationDegrees longitude#>)
//        self.mapView setCenterCoordinate:<#(CLLocationCoordinate2D)#> animated:<#(BOOL)#>
    }else if (index == 1){//普通模式
        self.mapView.mapType = MKMapTypeStandard;
    }else{
        self.mapView.mapType = MKMapTypeHybrid;
    }
}



- (MKMapView *)mapView{
    if (!_mapView) {
        _mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, JJSCREEN_W,JJSCREEN_H - 64)];
        _mapView.zoomEnabled = YES;
        _mapView.showsUserLocation = YES;
        _mapView.userTrackingMode = MKUserTrackingModeFollowWithHeading;
        _mapView.delegate = self;
    }
    return _mapView;
}

- (UISegmentedControl *)segemtControl{
    if (!_segemtControl) {
        _segemtControl = [[UISegmentedControl alloc] initWithItems:@[@"定位",@"普通地图",@"混合地图"]];
        _segemtControl.center = CGPointMake(JJSCREEN_W * 0.5, 50);
        [_segemtControl addTarget:self action:@selector(segmentAction) forControlEvents:UIControlEventValueChanged];
//        [_segemtControl targetForAction:@selector(segmentAction) withSender:nil];
    }
    return _segemtControl;
}

- (CLLocationManager *)manager{
    if (!_managerL) {
        _managerL = [[CLLocationManager alloc] init];
        
    }
    return _managerL;
}

@end
