//
//  Different-Questions-Explantaion.cpp
//  DSA-Cpp
//
//  Created by Codes Orbit on 30/09/2023.
//

#include <stdio.h>
#include <iostream>
using namespace std;


//MARK: - Kth Smallest Element

//MARK: - Time Complexity
/**
 Time Complexity: O(N)
 Space Complexity: O(1)
 */
//MARK: - Comments About Question
/**
 
 */
//MARK: - Questions Links.
/**
 https://practice.geeksforgeeks.org/problems/kth-smallest-element/0
 */
//MARK: - Personal Comments
/**
UnderStand Question First edge cases and other constraints.
 */

class Solution {
  public:
    int getMinDiff(int arr[], int n, int k) {
        // code here
        
        sort(arr,arr+n);
        int  diff = arr[n-1] - arr[0];
        int minValue = arr[0];
        int maxValue = arr[n-1];
        
        for(int i=1; i<n; i++){
            if(arr[i] < k){
                continue; // if value is -neg then skip next part
            }
            minValue = min(arr[0] + k, arr[i]-k);// compare after subtraction with minimum value because it might be the case that after subtraction value become less then minimum value of array
            maxValue = max(arr[n-1] - k, arr[i-1] +k); // same as above do addition instead of subtraction. compare with last value or max value of array.
            diff = min(diff, maxValue - minValue); // calculate difference and get min distance.
        }
        return diff;
    }
};

//MARK: - Minimum jumps to reach at end of array

//MARK: - Time Complexity
/**
 Time Complexity: O(N)
 Space Complexity: O(1)
 */
//MARK: - Comments About Question
/**
 
 */
//MARK: - Questions Links.
/**
 https://practice.geeksforgeeks.org/problems/minimum-number-of-jumps/0 */
//MARK: - Personal Comments
/**

 */

class Solution1{
  public:
    int minJumps(int arr[], int n){
        // Your code here
        int jumps = 0;
        int curMax = 0;
        int curReach = 0;
        n = n -1; // because when at end index no need to update jumps because we already at end.
        for(int i=0; i<n; i++){
            
            if(arr[i] + i > curMax){ // jump size can make from ith location. [3, 2, 2 ,4, 5, 6 ] in following example jump size in index zero is 3 so we can max go from zero to 0 + 3 location.
                curMax = arr[i] + i;
            }
            
            if(i == curReach){ //update jump when we reach at max jump size position.
                jumps++;
                curReach = curMax;
            }
            
            if(arr[i] == 0 && i == curMax){ // in case of zero can not go further and if i is equal to jump size that means we can max reach at that position.
                return -1;
            }
        }
        return jumps;
    }
};

void print(){
    cout<<"Hello from print";
}
