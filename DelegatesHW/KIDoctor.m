//
//  KIDoctor.m
//  DelegatesHW
//
//  Created by n1ke71 on 13.12.2017.
//  Copyright © 2017 n1ke71. All rights reserved.
//

#import "KIDoctor.h"

@implementation KIDoctor

-(NSString*) gotoSleep{
   
 
    return @"gotoSleep";
}
-(NSString*) takePill{
    
     return @"takePill";
}
-(NSString*) makeShot{
    
    return @"makeShot";
    
}

-(NSString*) bodyPartDescription:(NSUInteger) bodyPart{
    
    NSString* partDescription = @"NOT identified";
  
    switch (bodyPart) {
        case 1:
            partDescription = @"Head";
            break;
        case 2:
            partDescription = @"Leg";
        case 3:
            partDescription = @"Stomach";
        case 4:
            partDescription = @"Arm";

    }
    
    return partDescription;
    
}

-(NSString*) makeRaport:(NSString*) patient hasGotAPain:(NSString*) bodyPart{
    
    return [NSString stringWithFormat:@"Doctors name %@ patient %@ has got a pain in %@",self.name,patient,bodyPart];
}
/*
#pragma mark - KIPatientDelegate

-(void)patientFeelsBad:(KIPatient*)patient patientBodyPain:(KIPatientBodyParts) bodyPart {
    
    NSLog(@"Doctors  name:%@"  ,self.name);
    NSLog(@"Patients  name:%@" ,patient.name);
    NSLog(@"Patients temp:%.1f",patient.temperature);
    NSLog(@"Patients pres:%.1f",patient.pressure);
    NSLog(@"Patients has pain in:%@" ,[self bodyPartDescription:bodyPart]);
   
    NSString* stringForReport =  [self makeRaport:patient.name hasGotAPain:[self bodyPartDescription:bodyPart]]; //Отчет по пациенту
    
    
    [self.dailyRaport addObject:stringForReport]; //Создаем массив строк для регистрации
  
    
    if (patient.temperature <= 36.6 | patient.temperature < 37 | bodyPart == KIPatientHead) {
        
        NSLog(@"Patient name:%@ %@",patient.name,[self gotoSleep]);
    }
    else if (patient.temperature >= 37. && patient.temperature < 39. | patient.pressure >= 180. && patient.pressure < 190. | bodyPart == KIPatientArm){
        
        NSLog(@"Patient name:%@ %@",patient.name,[self takePill]);
    }
    else if (patient.temperature >= 39. | patient.pressure >= 190. | bodyPart == KIPatientLeg | bodyPart == KIPatientStomach){
        
        NSLog(@"Patient name:%@ %@",patient.name,[self makeShot]);
    }
    else NSLog(@"Patient name:%@ feels fine",patient.name);
    
    patient.doctorsRate = arc4random()%2;
    NSLog(@"doctorsRate:%u" ,patient.doctorsRate);
}*/
@end
