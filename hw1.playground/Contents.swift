import UIKit

//#1 fibonacci series
func q1(num: Int)->[Int]{
    var initial = [0,1]
    if num<=1{
        return initial
    }
    for _ in 0...num - 2 {
        let a = initial[initial.count - 2]
        let b = initial.last!
        initial.append(a+b)
    }
    return initial
}

q1(num: 7)

//#2 prime checker

func q2(num:Int)->Bool{
    if num <= 3{
        if num <= 1{
            return false
        }
        return true
        }
    else{
        for i in 2...Int(sqrt(Double(num))){
            if num % i == 0{
                return false
            }
        return true
        }
    }
    return true
}

q2(num:12)

//#3 factorial calculator
func q3(num: Int) -> Int {
    if num == 0 {
        return 1
    }
    else {
        return num * q3(num: (num - 1))
    }
}


q3(num: 6)
