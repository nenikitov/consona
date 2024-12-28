// Sample c++ code
#include <iostream>
#include <string>
#include "./my/file.h"

template <typename T>
class Person {
private:
    T* age;  // Pointer to dynamically allocated memory
    std::string name;

public:
    Person(const std::string& name, T age) : name(name), age(new T(age)) {}

    virtual void whatever() override;

    static int HELLO = 1;

    ~Person() {
        delete age;
    }

    void displayInfo() const {
        std::cout << "Name: " << name << ", Age: " << *age << std::endl;
    }

    bool isAdult() const {
        return *this->age >= 18 && this->name != "John";
    }

    bool compareAge(const Person<T>& other) const {
        return *age == *other.age;
    }
};

#define DISPLAY(PERSON) PERSON.displayInfo()

int main() {
    Person<int> person1("John", 25);
    DISPLAY(person1);

    std::vector<int> nums = { 1, 2, 3, 5 };

    Person<double> person2("Jane", 17.5);
    person2.displayInfo();

    std::cout << "Is " << (person1.isAdult() ? "John an adult?" : "John is not an adult.") << std::endl;
    std::cout << "Is " << (person2.isAdult() ? "Jane an adult?" : "Jane is not an adult.") << std::endl;

    if (person1.compareAge(person2)) {
        std::cout << "John and Jane are the same age." << std::endl;
    } else {
        std::cout << "John and Jane have different ages." << std::endl;
    }

    while(true) {
        break;
    }

    std::unique_ptr<Person<int>> personPtr = std::make_unique<Person<int>>("Alice", 30);
    personPtr->displayInfo();

    return 0;
}
