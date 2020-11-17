import UIKit

// #1 mergesort
func mergesort<Element: Comparable>(_ array: [Element]) -> [Element] {
//    if array.count<=1 {
//        return array
//    }
    guard array.count > 1 else {
        return array
    }
    let middle = array.count / 2
    let left = mergesort(Array(array[..<middle]))
    let right = mergesort(Array(array[middle...]))
    return merge(left, right)
}

private func merge<Element: Comparable>(_ left: [Element],
                                        _ right: [Element]) -> [Element] {
    var leftind = 0
    var rightind = 0
    var result: [Element] = []
    
    while leftind < left.count && rightind < right.count{
        let leftElement = left[leftind]
        let rightElement = right[rightind]
        
        if leftElement < rightElement {
            result.append(leftElement)
            leftind += 1
        } else if leftElement > rightElement {
            result.append(rightElement)
            rightind += 1
        } else {
            result.append(leftElement)
            leftind += 1
            result.append(rightElement)
            rightind += 1
        }
    }
    
    if leftind < left.count {
        result.append(contentsOf: left[leftind...])
    }
    if rightind < right.count {
        result.append(contentsOf: right[rightind...])
    }
    
    return result
}

let arr = [8,2,3,4,6,1,5,9]
let sortint = mergesort(arr)
print(sortint)


//#2 heapsort
func heapSort(_ arr:inout Array<Int>) {
    for i in (0...(arr.count/2-1)).reversed(){
        adjustHeap(arr: &arr, i: i, length: arr.count)
    }
    for j in (1...(arr.count-1)).reversed(){
        arr.swapAt(0, j)
        adjustHeap(arr: &arr, i: 0, length: j)
    }
}
func adjustHeap(arr:inout Array<Int>,i:Int,length:Int) {
    var i = i;
    let temp = arr[i];
    var k=2*i+1
    while k<length {
        if(k+1<length && arr[k]<arr[k+1]){
            k+=1;
        }
        if(arr[k] > temp){
            arr[i] = arr[k];
            i = k;
        }else{
            break;
        }
        k=k*2+1
    }
    arr[i] = temp;
}

var data1 = [3,3,6,4,2,8,1,2,5,4,9]
heapSort(&data1)
print(data1)

//#3 quicksort
func quicksort<Element: Comparable>(_ data:[Element])->[Element]{
    guard data.count > 1 else { return data }
     var left:[Element] = []
     var right:[Element] = []
     let pivot:Element = data[data.count-1]
     for index in 0..<data.count-1 {
         if data[index] < pivot {
             left.append(data[index])
         }else{
             right.append(data[index])
         }
     }
     
     var result = quicksort(left)
     result.append(pivot)
     let rightResult = quicksort(right)
     result.append(contentsOf: rightResult)
     return result
 }

let data = [5.4,3,1,6,4,2,3,2,6,8,9,0]
let qs = quicksort(data)
print(qs)


//#4 selection sort
func selectionSort<Element: Comparable>(_ array: [Element]) -> [Element] {
  guard array.count > 1 else { return array }
  var a = array
  for x in 0 ..< a.count - 1 {
    var lowest = x
    for y in x + 1 ..< a.count {
      if a[y] < a[lowest] {
        lowest = y
      }
    }
    if x != lowest {
      a.swapAt(x, lowest)
    }
  }
  return a
}

let arr2 = [5,3,1,6,4,2,3,2,6,8,9,0]
let res = selectionSort(arr2)
print (res)

//#5binary search
func binarySearch( _ array: [Int],  _ left: Int, _ right: Int, _ n: Int) -> Int{
    var l = left
    var r = right
    
    while l < r {
        
        let mid = (l+r) / 2
        
        if array[mid] == n {
            return mid
        }
        if array[mid] > n {
            r = mid - 1
        }
        if array[mid] < n{
            l = mid + 1
        }
    }
    return -1
}

let arr3 = [5,3,1,6,4]
let res2 = binarySearch(arr3,0,4,6)
print (res2)
