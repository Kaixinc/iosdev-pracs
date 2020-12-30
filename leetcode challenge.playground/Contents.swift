import UIKit


//Merge two sorted linked lists and return it as a new sorted list. The new list should be made by splicing together the nodes of the first two lists.



func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    if(l1 == nil) {return l2}
    if(l2 == nil) {return l1}
    var result:ListNode?
    
    if(l1!.val <= l2!.val) {
        result = l1
        result!.next = mergeTwoLists(l1!.next,l2)
    }
    else {
        result = l2
        result!.next = mergeTwoLists(l1,l2!.next)
    }
    return result
}


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

var a = ListNode(2)
var b = ListNode(6)
var c = ListNode(7)
a.next = b
b.next = c

var d = ListNode(5)
var e = ListNode(8)
var f = ListNode(9)
d.next = e
e.next = f

func printNode(_ input: ListNode) {
    var current: ListNode? = input
    while current != nil {
        print("\(current!.val) -> ", separator: "", terminator: "")
        current = current?.next
    }
    print(current as Any)
}

printNode(a)
printNode(d)
let res = mergeTwoLists(a, d)
printNode(res!)

