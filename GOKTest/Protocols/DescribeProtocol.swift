//
//  DescribeProtocol.swift
//  GOKTest
//
//  Created by Danilo Requena on 06/05/22.
//

import Foundation

public protocol DescribeProtocol: AnyObject {}

extension DescribeProtocol where Self: NSObject {
    public static var identifier: String {
        String(describing: self)
    }
}
