//
//  MergeSort.swift
//  SortTest
//
//  Created by zjj on 2021/5/26.
//

import Foundation

typealias E = Int

class MergeSort<E: Comparable> {
    var array = NSMutableArray()
    var leftTemp = NSMutableArray()
    // 用NSMutableArray比Swift.Array快？？？
    init(array: [E]) {
        for i in array {
            self.array.add(i)
        }
        if let fir = self.array.firstObject as? E {
            for _ in 0 ..< (self.array.count / 2 + 1) {
                self.leftTemp.add(fir)
            }
        }
    }
    
    func sort() -> [E] {
        self.sort(begin: 0, end: self.array.count)
        return self.array as! [E]
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
            self.leftTemp[i] = self.array[i + begin]
        }
        while leftIndex < leftEnd {
            if rightIndex < rightEnd && (self.leftTemp[leftIndex] as! E) > (self.array[rightIndex] as! E) {
                self.array[arrayIndex] = self.array[rightIndex]
                arrayIndex += 1
                rightIndex += 1
            } else {
                self.array[arrayIndex] = self.leftTemp[leftIndex]
                arrayIndex += 1
                leftIndex += 1
            }
        }
    }
}
