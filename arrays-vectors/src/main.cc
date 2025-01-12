#include <iostream>
#include "../include/vectors.h"

using std::cout;
using std::cin;
using std::endl;

int main(void)
{
    cout << "First: " << test_scores[0] << endl;
    cout << "Second: " << test_scores[1] << endl;
    cout << "Third: " << test_scores[2] << endl;
    cout << "Fourth: " << test_scores[3] << endl;
    cout << "Fifth: " << test_scores[4] << endl << endl;

    // at method
    // vector methods provide bounds checking and not subscript
    cout << "First: " << test_scores.at(0) << endl;
    cout << "Second: " << test_scores.at(1) << endl;
    cout << "Third: " << test_scores.at(2) << endl;
    cout << "Fourth: " << test_scores.at(3) << endl;
    cout << "Fifth: " << test_scores.at(4) << endl << endl;

    // push_back method for insertion - vector will allocate space
    test_scores.push_back(80);
    test_scores.push_back(76);
    cout << "Size now is: " << test_scores.size() << endl;
    cout << "Sixth: " << test_scores.at(5) << endl;
    cout << "Seventh: " << test_scores.at(6) << endl;

    // print vector matrix
    cout << "Matrix" << endl;
    cout << matrix.at(0).at(0) << " ";
    cout << matrix.at(0).at(1) << " ";
    cout << matrix.at(0).at(2) << " ";
    cout << matrix.at(0).at(3) << endl;

    cout << matrix.at(1).at(0) << " ";
    cout << matrix.at(1).at(1) << " ";
    cout << matrix.at(1).at(2) << " ";
    cout << matrix.at(1).at(3) << endl;

    cout << matrix.at(2).at(0) << " ";
    cout << matrix.at(2).at(1) << " ";
    cout << matrix.at(2).at(2) << " ";
    cout << matrix.at(2).at(3) << endl;

}