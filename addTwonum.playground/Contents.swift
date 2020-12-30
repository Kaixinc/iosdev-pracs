import UIKit

var str = "Hello, playground"


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

var a = ListNode(2)
var b = ListNode(4)
var c = ListNode(3)
a.next = b
b.next = c

var d = ListNode(5)
var e = ListNode(6)
var f = ListNode(4)
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


func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var l1 = l1
    var l2 = l2
    var prev = ListNode(0)
    var carry = 0
    let head = prev
    
    while l1 != nil || l2 != nil || carry != 0 {
        let cur = ListNode(0)
        let sum = (l2 == nil ? 0 : l2!.val) + (l1 == nil ? 0 : l1!.val) + carry
        cur.val = sum % 10
        carry = sum / 10
        prev.next = cur
        prev = cur
        l1 = l1 == nil ? l1: l1?.next
        l2 = l2 == nil ? l2: l2?.next
    }
    
    return head.next
}


let res = addTwoNumbers(a, d)
printNode(res!)
