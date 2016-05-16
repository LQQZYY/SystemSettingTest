//
//  ViewController.m
//  ApplicationSettingTest
//
//  Created by Artron_LQQ on 16/5/13.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)NSMutableArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UITableView *table = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview:table];
}

- (NSMutableArray *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [[NSMutableArray alloc]initWithObjects:@"prefs:root=INTERNET_TETHERING"
                      ,@"prefs:root=WIFI",
                      @"prefs:root=Bluetooth",
                      @"prefs:root=NOTIFICATIONS_ID",
                      @"prefs:root=General",
                      @"prefs:root=DISPLAY&BRIGHTNESS",
                      @"prefs:root=Wallpaper",
                      @"prefs:root=Sounds",
                      @"prefs:root=Privacy",
                      @"prefs:root=STORE",
                      @"prefs:root=NOTES",
                      @"prefs:root=SAFARI",
                      @"prefs:root=MUSIC",
                      @"prefs:root=Photos",
                      @"prefs:root=CASTLE",
                      @"prefs:root=General&path=About",
                      @"prefs:root=General&path=SOFTWARE_UPDATE_LINK",
                      @"prefs:root=General&path=DATE_AND_TIME",
                      @"prefs:root=General&path=ACCESSIBILITY",
                      @"prefs:root=General&path=Keyboard",
                      @"prefs:root=General&path=VPN",
                      @"prefs:root=FACETIME",
                    @"prefs:root=General&path=AUTOLOCK",
                      @"prefs:root=General&path=INTERNATIONAL",
                      @"prefs:root=LOCATION_SERVICES",
                      @"prefs:root=Phone",
                      @"prefs:root=General&path=ManagedConfigurationList",@"prefs:root=Privacy&path=CAMERA",@"prefs:root=Privacy&path=PHOTOS", nil];
    }
        
    return _dataArray;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    }
    
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *string = self.dataArray[indexPath.row];
//    NSString *string = [NSString stringWithFormat:@"prefs:root=%@",str];
    NSURL *url = [NSURL URLWithString:string];
    
    [[UIApplication sharedApplication]openURL:url];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
