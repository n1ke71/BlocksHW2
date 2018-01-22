//
//  AppDelegate.m
//  DelegatesHW
//
//  Created by n1ke71 on 13.12.2017.
//  Copyright © 2017 n1ke71. All rights reserved.
//

#import "AppDelegate.h"
#import "KIPatient.h"

typedef  void(^KIBlock)(KIPatient* patient,KIPatientBodyParts part);

@interface AppDelegate ()
@property(strong,nonatomic) KIPatient* patient1;
@property(strong,nonatomic) KIPatient* patient2;
@property(strong,nonatomic) KIPatient* patient3;
@property(strong,nonatomic) KIPatient* patient4;
@property(strong,nonatomic) KIPatient* patient5;
@property(strong,nonatomic) KIPatient* patient6;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.patient1 = [[KIPatient alloc]init];
    self.patient1.name = @"patient1";
    self.patient1.temperature = 30.f + (arc4random_uniform(10));
    self.patient1.pressure = 160.f + (arc4random_uniform(30));

    
    self.patient2 = [[KIPatient alloc]init];
    self.patient2.name = @"patient2";
    self.patient2.temperature = 30.f + (arc4random_uniform(10));
    self.patient2.pressure = 160.f + (arc4random_uniform(30));
  
    
    self.patient3 = [[KIPatient alloc]init];
    self.patient3.name = @"patient3";
    self.patient3.temperature = 30.f + (arc4random_uniform(10));
    self.patient3.pressure = 160.f + (arc4random_uniform(30));
 
   
    self.patient4 = [[KIPatient alloc]init];
    self.patient4.name = @"patient4";
    self.patient4.temperature = 30.f + (arc4random_uniform(10));
    self.patient4.pressure = 160.f + (arc4random_uniform(30));
  
    
    self.patient5 = [[KIPatient alloc]init];
    self.patient5.name = @"patient5";
    self.patient5.temperature = 30.f + (arc4random_uniform(10));
    self.patient5.pressure = 160.f + (arc4random_uniform(30));
  
    
    self.patient6 = [[KIPatient alloc]init];
    self.patient6.name = @"patient6";
    self.patient6.temperature = 30.f + (arc4random_uniform(10));
    self.patient6.pressure = 160.f + (arc4random_uniform(30));
 
    
    __weak KIPatient* weakPatient1 = self.patient1;
    __weak KIPatient* weakPatient2 = self.patient2;
    __weak KIPatient* weakPatient3 = self.patient3;
    __weak KIPatient* weakPatient4 = self.patient4;
    __weak KIPatient* weakPatient5 = self.patient5;
    __weak KIPatient* weakPatient6 = self.patient6;

    
    NSArray* array = [NSArray arrayWithObjects:weakPatient1,weakPatient2,weakPatient3,weakPatient4,weakPatient5,weakPatient6, nil];
    
 //Healing Block
    
    KIBlock block = ^(id object,KIPatientBodyParts part){
        
        KIPatient* patient = (KIPatient*)object;
        
        NSLog(@"Patients  name:%@" ,patient.name);
        NSLog(@"Patients temp:%.1f",patient.temperature);
        NSLog(@"Patients pres:%.1f",patient.pressure);
        NSLog(@"Patients has pain in:%@" ,[patient bodyPartDescription:part]);
        
        if (patient.temperature <= 36.6 | patient.temperature < 37 | part == KIPatientHead) {
            
            NSLog(@"Patient name:%@ %@",patient.name,[patient gotoSleep]);
        }
        else if (patient.temperature >= 37. && patient.temperature < 39. | patient.pressure >= 180. && patient.pressure < 190. | part == KIPatientArm){
            
            NSLog(@"Patient name:%@ %@",patient.name,[patient takePill]);
        }
        else if (patient.temperature >= 39. | patient.pressure >= 190. | part == KIPatientLeg | part == KIPatientStomach){
            
            NSLog(@"Patient name:%@ %@",patient.name,[patient makeShot]);
        }
        else NSLog(@"Patient name:%@ feels fine",patient.name);
        
        patient.doctorsRate = arc4random()%2;
        NSLog(@"doctorsRate:%u" ,patient.doctorsRate);
        
        
    };
    

    for (KIPatient* patient in array) {
        
        [patient patientFeelsBad:patient patientBodyPain:1 heelingBlock:block];
        
    }

    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
