import UIKit

// Print all values from 1-255.
for i in 1...255 {
    if i % 2 == 0 {
        print("\(i) is even")
    } else {
        print("\(i) is odd")
    }
}

// Print all values from 1-100 that are divisible by 3 or 5 but not both.
for i in 1...100 {
    if i % 3 == 0 && i % 5 == 0{
        print("\(i) is FizzBuzz")
    } else if i % 3 == 0 {
        print("\(i) is Fizz")
    }else if i % 5 == 0 {
        print("\(i) is Buzz")
    }
}
