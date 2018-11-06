//
//  ViewController.m
//  ZIpDemo
//
//  Created by chongdian on 2018/8/17.
//  Copyright © 2018年 chongdian. All rights reserved.
//

#import "ViewController.h"
#import <ZipArchive/ZipArchive.h>
#import <SSZipArchive.h>
#import <MJExtension.h>
#import "Model.h"

@interface ViewController () <ZipArchiveDelegate>

@end

//带密码的zip包解压缩, 方案A-ZipArchive，方案B-SSZipArchive
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *password = @"Bv+wxGHD5sen5JZEekPEuvFJa4y7J9wktQTEXFOjesE=";
    [self configZipArchiveWithPassword:password];//ZipArchive库
//    [self configSSZipArchiveWithPassword:password];//SSZipArchive库
}


- (void)configZipArchiveWithPassword:(NSString *)password
{
    //ZipArchive
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
//    NSString *zipPath = [path stringByAppendingPathComponent:@"zipDemo"];//创建压缩路径
//    NSString *filePath = [NSBundle.mainBundle pathForResource:@"city" ofType:@"txt"];//文件路径
    NSString *unZipPath = [path stringByAppendingPathComponent:@"unzipFile"];//解压路径(必须指定名称且就是解压的文件名)
    ZipArchive *zipArchive = ZipArchive.new;
    zipArchive.delegate = self;
    
    //创建压缩包
//    BOOL isZipSuccessful = [zipArchive CreateZipFile2:zipPath Password:@"123"];
//    if (isZipSuccessful) {
//        NSLog(@"创建压缩包成功");
//    }else {
//        NSLog(@"创建压缩包失败");
//    }

    //文件添加到压缩包
//    BOOL isAddFileSuccessful = [zipArchive addFileToZip:filePath newname:@"city"];
//    if (isAddFileSuccessful) {
//        NSLog(@"文件添加到压缩包成功");
//    }else {
//        NSLog(@"文件添加到压缩包失败");
//    }
//    [zipArchive CloseZipFile2];
    
    NSString *loadPath = [NSBundle.mainBundle pathForResource:@"1534816230951" ofType:@"zip"];
    //解压缩
    BOOL isUnZipSuccessful = [zipArchive UnzipOpenFile:loadPath Password:password];
    if (isUnZipSuccessful) {
        NSLog(@"解压包成功");
    }else {
        NSLog(@"解压包失败");
    }

    //释放压缩包到路径
    BOOL isOK = [zipArchive UnzipFileTo:unZipPath overWrite:YES];
    if (isOK) {
        NSLog(@"释放文件到压缩包成功");
        NSData *data = [NSData dataWithContentsOfFile:unZipPath options:0 error:nil];
        NSArray <Model *>*array = [Model mj_objectArrayWithKeyValuesArray:data];
        if (array.count > 0) {
            NSLog(@"读取文件成功");
        }
    }else {
        NSLog(@"释放文件到压缩包失败");
    }
    [zipArchive UnzipCloseFile];
    
    NSLog(@"\n%@\n", unZipPath);
}

- (void)ErrorMessage:(NSString *)msg
{
    NSLog(@"错误信息 = %@", msg);
}




/**
 SSZipArchive
 */
- (void)configSSZipArchiveWithPassword:(NSString *)password
{
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    NSString *zipPath = [NSBundle.mainBundle pathForResource:@"1534816230951" ofType:@"zip"];
    NSString *unzipPath = [path stringByAppendingPathComponent:@"unzipFile"];
    
    //带密码的zip包解压
    //参数(压缩包路径，存储至路径，是否允许读写，密码，进度状态，完成回调)
    [SSZipArchive unzipFileAtPath:zipPath toDestination:unzipPath overwrite:NO password:password progressHandler:^(NSString * _Nonnull entry, unz_file_info zipInfo, long entryNumber, long total) {
        NSLog(@"%ld-%ld", entryNumber, total);
    } completionHandler:^(NSString * _Nonnull path, BOOL succeeded, NSError * _Nullable error) {
        if (succeeded) {
            NSLog(@"解压成功");
            NSLog(@"\n%@\n%@\n", zipPath, unzipPath);
            NSString *finalPath = [unzipPath stringByAppendingPathComponent:@"1534816230951.txt"];
            NSData *data = [NSData dataWithContentsOfFile:finalPath options:0 error:nil];
            NSArray <Model *>*array = [Model mj_objectArrayWithKeyValuesArray:data];
            if (array.count > 0) {
                NSLog(@"读取文件成功");
            }

        }else {
            NSLog(@"解压失败");
        }
    }];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
