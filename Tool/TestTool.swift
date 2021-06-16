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
            for work in self.works.shuffled() {
                self.concurrentQueue.async(group: group, qos: .unspecified, flags: []) {
                    work()
                }
            }
            group.wait()
        }
    }
}
