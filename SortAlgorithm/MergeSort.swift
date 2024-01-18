//
//  MergeSort.swift
//  SortTest
//
//  Created by zjj on 2021/5/26.
//

import Foundation

struct MergeSort<E: Comparable>: Sort {
    var items: [E]
    
     init(array: [E]) {
        items = array
        for _ in 0 ..< (items.count / 2 + 1) {
            leftTemp.append(items.first!)
        }
    }
    
    private var leftTemp = [E]()
    
    mutating func sorted() -> [E] {
        sort(begin: 0, end: items.count)
        return items
    }
    
    // 左闭右开
    private mutating func sort(begin: Int, end: Int) {
        if (begin + 1 < end) {
            let mid = (end + begin) / 2
            sort(begin: begin, end: mid)
            sort(begin: mid, end: end)
            merge(begin: begin, mid: mid, end: end)
//            print("merge index", begin, mid, end)
        }
    }
    
    private mutating func merge(begin: Int, mid: Int, end: Int) {
        var leftIndex = 0, leftEnd = mid - begin
        var rightIndex = mid, rightEnd = end
        var arrayIndex = begin
        for i in 0 ..< leftEnd { // 拷贝[begin, mid)
            leftTemp[i] = items[i + begin]
        }
        while leftIndex < leftEnd {
            if rightIndex < rightEnd && (leftTemp[leftIndex]) > (items[rightIndex]) {
                items[arrayIndex] = items[rightIndex]
                arrayIndex += 1
                rightIndex += 1
            } else {
                items[arrayIndex] = leftTemp[leftIndex]
                arrayIndex += 1
                leftIndex += 1
            }
        }
    }
}
