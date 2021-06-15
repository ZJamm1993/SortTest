//
//  TestTool.swift
//  SortTest
//
//  Created by zjj on 2021/6/15.
//

import Foundation

class TestTool {
    class AsyncGroup {
        typealias SomeWork = ()->()
        private let concurrentQueue = DispatchQueue(label: "myAsync", attributes: .concurrent)
        private var works = [SomeWork]()
        func addWork(work: @escaping SomeWork) {
            self.works.append(work)
        }
        func startWork() {
            let group = DispatchGroup()
            for work in self.works {
                self.concurrentQueue.async(group: group, qos: .unspecified, flags: []) {
                    work()
                }
            }
            group.wait()
        }
    }
    
    typealias SortCollection = Array<Int>

    private static func testSort(name: String, function: () -> (SortCollection)) {
        print("Begin " + name + "...")
        
        let start = Date()
        let res = function()
        let end = Date()
        
        var desc = "-----------\nFinish " + name + "\n"
        desc = desc.appending("TimeInterval: \(end.timeIntervalSinceReferenceDate - start.timeIntervalSinceReferenceDate)\n")
        desc = desc.appending("Checked: \(NumberTool.isSorted(arr: res)) \n")
        print(desc)
    }

    static func test() {
        var arr: [Int] = []
        let count = 1000000
        testSort(name: "Init datas") {
            arr = NumberTool.randomInts(count: count)
    //        arr = NumberTool.sortInts(begin: 0, end: count)
            return arr
        }

    //    TestSort(name: "NSArraySortDescriptor") {
    //        return NSArraySort(array: arr).sorted()
    //    }
    //    TestSort(name: "SwiftSort") {
    //        return SwiftArraySort(array: arr).sorted()
    //    }
        
        let group = AsyncGroup()
        group.addWork {
            testSort(name: "QuickSort") {
                return QuickSort(array: arr).sorted()
            }
        }
        group.addWork {
            testSort(name: "MergeSort") {
                return MergeSort(array: arr).sorted()
            }
        }
        group.addWork {
            testSort(name: "HeapSort") {
                return HeapSort(array: arr).sorted()
            }
        }
//        group.addWork {
//            testSort(name: "BubbleSort") {
//                return BubbleSort(array: arr).sorted()
//            }
//        }
        group.startWork()
    }
}
