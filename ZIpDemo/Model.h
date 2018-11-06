//
//  Model.h
//  ZIpDemo
//
//  Created by chongdian on 2018/8/21.
//  Copyright © 2018年 chongdian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject


@property(nonatomic,copy)NSString* mapIcon;
@property(nonatomic,copy)NSString* areaName;
@property(nonatomic,copy)NSString* operatorTypes;
@property(nonatomic,assign)long link;
@property(nonatomic,copy)NSString* province;
@property(nonatomic,copy)NSString* company;
@property(nonatomic,copy)NSString* name;
@property(nonatomic,assign)long status;
@property(nonatomic,assign)long currentType;
@property(nonatomic,copy)NSString* payType;
@property(nonatomic,assign)long connectorType;
@property(nonatomic,copy)NSString* images;
@property(nonatomic,assign)double lng;
@property(nonatomic,assign)double lat;
@property(nonatomic,copy)NSString* cityName;
@property(nonatomic, copy) NSString *cityCode;
@property(nonatomic,copy)NSString* city;
@property(nonatomic,assign)long priceRational;
@property(nonatomic,assign)long score;
@property(nonatomic,assign)long serviceCode;
@property(nonatomic,copy)NSString* id;
@property(nonatomic,assign)long chargerQuantity;
@property(nonatomic,assign)long quantity;
@property(nonatomic,assign)long isGs;
@property(nonatomic,assign)long standard;
@property(nonatomic,assign)long maxOutPower;
@property(nonatomic,copy)NSString* phone;
@property(nonatomic,assign)long plugType;
@property(nonatomic,assign)long freeNum;
@property(nonatomic,copy)NSString* address;
@property(nonatomic,assign)long supportOrder;
@property(nonatomic,assign)double distance;
@property(nonatomic,assign) NSInteger iscollection;
@property(nonatomic, assign) NSInteger stationType;
@end
