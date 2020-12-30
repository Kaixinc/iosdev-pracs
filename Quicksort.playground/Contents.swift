import UIKit

var str = "Hello, playground"

func partition(input:inout [Int], low:Int,high:Int) -> Int{
    let pivot = input[high]
    var index = low
    for i in low...high{
        if input[i] < pivot{
            if i != index{
                input.swapAt(i, index)
                }
            index = index + 1
        }
    }
    
    if high != index{
        input.swapAt(high, index)
    }
    return index
}

func quicksort(input:inout [Int], low:Int,high:Int)->[Int]{
    if low > high{
        return input
    }
    let Indetxsorting = partition(input: &input, low: low, high: high)
    quicksort(input: &input, low: low, high: Indetxsorting - 1)
    quicksort(input: &input, low: Indetxsorting + 1, high: high)
    return input
}

var array = [8,10,23,3,7,2,123,33,555,4]

quicksort(input: &array, low: 0, high: array.count - 1)

