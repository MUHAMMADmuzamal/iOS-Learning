//
//  main.cpp
//  DSA-Cpp
//
//  Created by Codes Orbit on 30/09/2023.
//

#include <iostream>
#include <vector>
//#include "Arrays/Different-Questions-Explantaion"
using namespace std;
bool isRotationOfOtherString(string str, string str1){
    int index = 0;
    int i=0;
    while(i < str.length() && str1.length()){
        if(str[index] == str1[i]){
            index++;
        }else{
            index = 0;
        }
        i++;
    }
    return index != i;
}

string countAndSay(int n) {
        if(n == 1){
            return "1";
        }
        string str = "";
        str +=  countAndSay(n - 1);
        
        char countChar = str[0];
        int count = 0;
        int strLength = str.size();
        for(int i =0; i<strLength; i++){
            int j = i;
            while(j < strLength && str[j] == countChar){
                    count++;
                j++;
                i++;
                }
            
            str = to_string(count) + countChar + str;
            countChar = str[i];
            count = 1;
            }
        

        return str;
    }

int main(int argc, const char * argv[]) {
    // insert code here...
    cout << "Hello, World!\n";
//    print();
    string str = "mightandmagic";
    string str1 = "andmagicmigth";
    if(isRotationOfOtherString(str,str1)){
        cout<<"Yes"<<endl;
    }else{
        cout<<"No"<<endl;
    }
    cout<<"--: "<<countAndSay(4)<<endl;
    return 0;
}
