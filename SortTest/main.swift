//
//  main.swift
//  SortTest
//
//  Created by zjj on 2021/5/8.
//

import Foundation

print("Hello, World!")

let arr = NumberTool.randomInts(count: 1000000)
print("start", Date())
//print(arr)
//let mer = MergeSort(array: arr)
let res = MergeSort(array: arr).sort()
//let res = arr.sorted()
print("end", Date())
print("check:", NumberTool.isSorted(arr: res))
//print(res)
