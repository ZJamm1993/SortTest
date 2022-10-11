//
//  main.swift
//  SortTest
//
//  Created by zjj on 2021/5/8.
//

import Foundation

print("Hello, World!")

var arr: [Int] = []
let count = 100000
arr = NumberTool.randomInts(count: count)
//        arr = NumberTool.sortInts(begin: 0, end: count)

//    TestSort(name: "NSArraySortDescriptor") {
//        return NSArraySort(array: arr).sorted()
//    }
//    TestSort(name: "SwiftSort") {
//        return SwiftArraySort(array: arr).sorted()
//    }

let group = TestTool.AsyncGroup()
group.addWork {
    MergeSort.testSort(arr: arr)
}
group.addWork {
    HeapSort.testSort(arr: arr)
}
group.addWork {
    NSArraySort.testSort(arr: arr)
}
group.addWork {
    SwiftArraySort.testSort(arr: arr)
}
group.addWork {
    QuickSort.testSort(arr: arr)
}
group.startWork()
