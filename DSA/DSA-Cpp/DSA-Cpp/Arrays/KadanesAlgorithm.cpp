//
//  KadanesAlgorithm.cpp
//  DSA-Cpp
//
//  Created by Codes Orbit on 30/09/2023.
//
//MARK: - Time Complexity
/**
 Time Complexity: O(N)
 Space Complexity: O(1)
 */
//MARK: - Comments About Algorithm
/**
 in kadane's algorithm we keep if sum is positive otherwise sum = 0
 */
//MARK: - Example Questions.
/**
 find Largest sum contiguous Subarray [V. IMP]
 Kadane's Algo [V.V.V.V.V IMP]
 https://practice.geeksforgeeks.org/problems/kadanes-algorithm/0
 */
//MARK: - Personal Comments
/**
 i think O(n^2) solution.
 */
#include <stdio.h>
#include <iostream>
using namespace std;

long long maxSubarraySum(int arr[], int n){
    
    // Your code here
    long long  maxSum =INT_MIN;
    long long sum = 0;
    for(int i=0; i<n; i++){
        
        sum += arr[i];
        if(sum > maxSum){
            maxSum = sum;
        }
        // Here check sum < 0 kadane's algorithm condition.
        if(sum < 0){
            sum =0;
        }
    }
    return maxSum;
}
