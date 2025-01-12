#include <iostream>

using std::cout;
using std::endl;

int scores [] {100,90,70};

int main(void)
{
    for(int score : scores)
    {
        cout << score << endl;
    }
    for(auto score : scores)
    {
        cout << score << endl;
    }
    return 0;
}
