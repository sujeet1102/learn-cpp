#include <iostream>

int main(void)
{
    int fav_num;
    std::cout << "Enter your favourite number: ";
    std::cin >> fav_num;
    std::cout << "Same here: " << fav_num << std::endl;

    // Initializations in cpp
    // c style
    int age = 16;
    std::cout << age << std::endl;
    // cpp constructor style
    int month (12);
    std::cout << month << std::endl;
    // cpp list style c++11 standard
    int year {1996};
    std::cout << year << std::endl;
    
    return 0;
}
