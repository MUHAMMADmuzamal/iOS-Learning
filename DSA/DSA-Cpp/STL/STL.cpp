//
//  STL.cpp
//  STL
//
//  Created by Codes Orbit on 30/09/2023.
//

#include <iostream>
#include "STL.hpp"
#include "STLPriv.hpp"

void STL::HelloWorld(const char * s)
{
    STLPriv *theObj = new STLPriv;
    theObj->HelloWorldPriv(s);
    delete theObj;
};

void STLPriv::HelloWorldPriv(const char * s) 
{
    std::cout << s << std::endl;
};

