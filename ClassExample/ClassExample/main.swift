//
//  main.swift
//  ClassExample
//
//  Created by ping tseng tsai on 2018-05-09.
//  Copyright © 2018 ping tseng tsai. All rights reserved.
//

import Foundation

let m1 = Movie(title: "Titanic", director: "James", genre: "Romance", releaseYear: 1997)

//let dirtyWordsArray = ["phooey", "darn", "drat", "blurgh", "jupiters", "argh", "fudge"]
//for word in dirtyWordsArray{
//    var arr: [String] = []
//    let str = word.suffix(2)
//
//    let str1 = word.prefix(word.count-4)
//    print(str1)
//}

//func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
//    let size = nums.count
//    var arr = [Int]()
//    for i in 1..<size+1 {
//        arr.append(i)
//    }
//    for e in nums{
//        if let loc = arr.index(of: e){
//            arr.remove(at: loc)
//        }
//    }
//    return arr
//}
//print(findDisappearedNumbers([4,3,2,7,8,2,3,1]))

func findDisappearedNumbers2(_ nums: [Int]) -> [Int] {
    var nums = nums
    for e in nums {
        if nums[abs(e)-1] > 0 {
            nums[abs(e)-1] *= -1
        }
    }
    var res = [Int]()
    for i in 0..<nums.count{
        if nums[i] > 0 {
            res.append(i+1)
        }
    }
    return res
}
print(findDisappearedNumbers2([4,3,2,7,8,2,3,1]))


var nums = [0, 1, 0, 3, 12]
func moveZeroes(_ nums: inout [Int]) {
    var index = 0
    for num in nums{
        if(num != 0){
           nums[index] = num
            index += 1
        }
    }
    for i in index ..< nums.count{
        nums[i] = 0
    }
    
//    while(index < nums.count){
//        nums[index] = 0
//        index += 1
//    }
}
moveZeroes(&nums)
print(nums)


class TreeNode{
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

//     1
//    / \
//   2   3
//    \
//     5

var root = TreeNode(1)
var node1 = TreeNode(2)
var node2 = TreeNode(3)
var node3 = TreeNode(5)

root.left = node1
root.right = node2
node1.right = node3

func binaryTreePaths(_ root: TreeNode?) -> [String] {
    var paths = [String]()
    if let root = root{ dfs(root, "", &paths)}
    return paths
}
//depth first search
func dfs(_ root: TreeNode?, _ path: String, _ paths: inout [String]) {
    if let root = root {
        if root.left == nil && root.right == nil {
            paths.append(path + String(root.val))
        }
        if let left = root.left {
            dfs(left, path + String(root.val) + "->", &paths)
        }
        if let right = root.right {
            dfs(right, path + String(root.val) + "->",&paths)
        }
    }
}
print(binaryTreePaths(root))

//Recursion: a function calling itself.
//Iteration: using a loop


func maxHeight(_ root: TreeNode?) -> Int {
    //if root is cadiz
    // return 0
    //else
    //  leftMax = maxHeight(root left?)
    //  rightMax = maxHeight(root right?)
    //  return max(leftMax, rightMax) + 1
    if let root = root {
        let leftMax = maxHeight(root.left)
        let rightMax = maxHeight(root.right)
        return max(leftMax, rightMax) + 1
    }else {//if nil
        return 0
    }
}

print(maxHeight(root))

//func factorial(_ n: Int) -> Int {
//    var res = 1
//    for i in 2..<n+1 {
//        res *= i
//    }
//    return res
//}
//
//func factorial_recur(_ n: Int) -> Int {
//    if n <= 1 {
//        return 1
//    }
//    return n * factorial_recur(n-1)
//}

func numJewelsInStones(_ J: String, _ S: String) -> Int {
    let arr = Array(J)
    let arr2 = Array(S)
    var count = 0;
    
    for i in arr{
        for j in arr2{
            if i == j{
                count+=1
            }
        }
    }
    return count
};

print(numJewelsInStones("aA", "aAAbbbb"))


var nonsenseArray = ["bungalow", "buffalo", "indigo", "although", "Ontario", "albino", "%$&#!"]
var arr = [String]()
for index in 0..<nonsenseArray.count{
    arr.append(nonsenseArray[index].removeLast().description)
}
let str = arr.joined(separator: "")
print(str)

