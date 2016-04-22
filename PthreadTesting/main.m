//
//  main.m
//  PthreadTesting
//
//  Created by FarTeen on 4/22/16.
//  Copyright © 2016 FarTeen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <pthread.h>

typedef struct {
    int *ar;
    long n;
} subarray;


void* incer(void *arg)
{
    long i;
    
    for (i = 0; i < ((subarray *)arg)->n; i++)
        ((subarray *)arg)->ar[i]++;
    printf("5555555");
    return (void*)"123";
}


int main(void)
{
    int        ar[1000000];
    pthread_t  th1, th2;
    subarray   sb1, sb2;
    
    
    sb1.ar = &ar[0];
    sb1.n  = 500000;
    (void) pthread_create(&th1, NULL, incer, &sb1);
    
    
    sb2.ar = &ar[500000];
    sb2.n  = 500000;
    (void) pthread_create(&th2, NULL, incer, &sb2);
    
    
    (void) pthread_join(th1, NULL);
    (void) pthread_join(th2, NULL);
    printf("......");
    return 0;
}