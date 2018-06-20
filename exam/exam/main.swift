//
//  main.swift
//  exam
//
//  Created by ping tseng tsai on 2018-05-11.
//  Copyright © 2018 ping tseng tsai. All rights reserved.
//
import Foundation

//Q1(swift)
var arr = [4,3,2,7,8,2,3,1]
func findDisappearedNumbers(_ nums: [Int]) -> [Int]{
    var nums = nums
    for num in nums{
        if(nums[abs(num)-1] > 0){
            nums[abs(num)-1] *= -1
        }
    }
    var res = [Int]()
    
    for index in 0 ..< nums.count{
        if(nums[index] > 0){
            res.append(index + 1)
        }
    }
    return res
}
print(findDisappearedNumbers(arr))

//Q2(swift)
var s = "abcd"
var t = "abcde"
func findTheDifference(_ s: String, _ t: String) -> Character{
    var res = ""
    for a in Array(s){
        for b in Array(t){
            if(a != b){
                res = String(b)
            }
        }
    }
    return Character(res)
}
print(findTheDifference(s, t))

//Q3(swift)
func selfDividingNumbers(_ left: Int, _ right: Int) -> [Int]{
    var res = [Int]()
    var ones = 0
    var tens = 0
    for num in left...right{
        if (num == 10 || num == 20){
        }else{
            ones = num % 10
            tens = num % 10
            if(num % ones == 0 && num % tens == 0){
                res.append(num)
            }
            
        }
        
    }
    return res
}
print(selfDividingNumbers(1, 22))


//Q4(JavaScript)
var s = "hello"

function reverseString(str){
    return str.split("").reverse().join("");
}

//Q5(swift)
class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}
let node1 = TreeNode.init(1)
let node2 = TreeNode.init(2)
let node3 = TreeNode.init(3)
let node4 = TreeNode.init(5)

func binaryTreePaths(_ root: TreeNode?) -> [String]{

}

func dfs(_ root: TreeNode?, _ path: String, _paths: [String]){
    if let root = root{
        if let (root.left == nil && root.right == nil({
            path.append((String)root.val &paths )
        }
        if let root.left == nil{

        }
        if let root.left == nil{
        }
        
    }
}

//Q6(swift)
func maxDepth(_ root: TreeNode?) -> Int{
    if let root = root{
        let maxleft = root.left
        let maxright = root.right

    }
}

//Q7(swift)
func addDigits(_ num: Int) -> Int{
    var res = 0
    var num = num
    while num > 10 {
        res = num % 10 + num / 10
        num = res
    }
    return num
}
print(addDigits(38))

//Q8(swift)
func moveZeroes(_ nums: inout [Int]){
    var i = 0
    let length = nums.count
    for num in nums{
        if(num != 0){
            nums[i] = num
            i += 1
        }
    }
    
    while( i < length){
        nums[i] = 0
        i+=1
    }
}
var nums = [0, 1, 0, 3, 12]
moveZeroes(&nums)
print(nums)

//Q9(swift)
func singleNumber(_ nums: [Int]) -> Int{
    var res = [Int]()
    var ans = 0;
    for num in nums{
       res.append(num)
        for a in res{
            for b in nums{
                if (a == b){
                    res.remove(at: <#T##Int#>)
                }
            }
        }
    }
    return ans
}
var arr2 = [4,1,2,1,2]
print(singleNumber(arr2))

//Q10(swift)
class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
//ListNode pervious = nil
//ListNode current =



