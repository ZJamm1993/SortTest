//
//  main.swift
//  SortTest
//
//  Created by zjj on 2021/5/8.
//

import Foundation

print("Hello, World!")

func randomInts(count: Int) -> [Int] {
    var arr = [Int]()
    for i in (0 ..< count) {
        let ra = Int.random(in: 0 ..< 9999999)
        arr.append(ra)
    }
    return arr
}

let count = 1000000
print("Sort Test array count", count)
let arr = randomInts(count: count)

NSArraySort.testSort(arr: arr)
SwiftArraySort.testSort(arr: arr)
MergeSort.testSort(arr: arr)
HeapSort.testSort(arr: arr)
QuickSort.testSort(arr: arr)
//BubbleSort.testSort(arr: arr)
