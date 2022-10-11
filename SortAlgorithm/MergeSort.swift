//
//  MergeSort.swift
//  SortTest
//
//  Created by zjj on 2021/5/26.
//

import Foundation

class MergeSort<E: Comparable> : BaseSort<E> {
    var leftTemp = [E]()
    required init(array: [E]) {
        super.init(array: array)
        for _ in 0 ..< (self.items.count / 2 + 1) {
            self.leftTemp.append(0 as! E)
        }
    }
    
    override func sorted() -> [E] {
        self.sort(begin: 0, end: self.items.count)
        return self.items
    }
    
    // 左闭右开
    private func sort(begin: Int, end: Int) {
        if (begin + 1 < end) {
            let mid = (end + begin) / 2
            self.sort(begin: begin, end: mid)
            self.sort(begin: mid, end: end)
            merge(begin: begin, mid: mid, end: end)
//            print("merge index", begin, mid, end)
        }
    }
    
    private func merge(begin: Int, mid: Int, end: Int) {
        var leftIndex = 0, leftEnd = mid - begin
        var rightIndex = mid, rightEnd = end
        var arrayIndex = begin
        for i in 0 ..< leftEnd { // 拷贝[begin, mid)
            self.leftTemp[i] = self.items[i + begin]
        }
        while leftIndex < leftEnd {
            if rightIndex < rightEnd && (self.leftTemp[leftIndex]) > (self.items[rightIndex]) {
                self.items[arrayIndex] = self.items[rightIndex]
                arrayIndex += 1
                rightIndex += 1
            } else {
                self.items[arrayIndex] = self.leftTemp[leftIndex]
                arrayIndex += 1
                leftIndex += 1
            }
        }
    }
}
