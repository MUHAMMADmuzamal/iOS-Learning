//
//  Dutch National Flag Algorithm for two colors.cpp
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
 Here, we will use the famous Dutch National Flag Algorithm for two “colors”. The first color will be for all negative integers and the second color will be for all positive integers. We will divide the array into three partitions with the help of two pointers, low and high.

 ar[1…low-1] negative integers
 ar[low…high] unknown
 ar[high+1…N] positive integers
 Now, we explore the array with the help of low pointer, shrinking the unknown partition, and moving elements to their correct partition in the process. We do this until we have explored all the elements, and size of the unknown partition shrinks to zero.
 */
//MARK: - Example Questions.
/**
 
 Move negative numbers beginning positive end constant extra space
 https://www.geeksforgeeks.org/move-negative-numbers-beginning-positive-end-constant-extra-space/
 Example:
 input: 1, 2,  -4, -5, 2, -7, 3, 2, -6, -8, -9, 3, 2,  1
 output: -9 -8 -4 -5 -6 -7 3 2 2 2 1 3 2 1
 */
//MARK: - Personal Comments
/**
approaches.
 - sort array.
 - using another array to store first negative values and  then positive.
 */
#include <stdio.h>
#include <iostream>
using namespace std;

void reArrange(int arr[],int n){
      int low =0,high = n-1;
      while(low<high){
      if(arr[low]<0){
          low++;
      }else if(arr[high]>0){
          high--;
      }else{
        swap(arr[low],arr[high]);
      }
    }
}
