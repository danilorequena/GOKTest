//
//  PrintableError.swift
//  GOKTest
//
//  Created by Danilo Requena on 07/05/22.
//

public protocol PrintableError: Error {
    var title: String { get }
    var message: String { get }
    var image: String { get }
}

extension PrintableError {
    public static func ~= (lhs: PrintableError, rhs: PrintableError) -> Bool {
        lhs.title == rhs.title &&
            lhs.message == rhs.message &&
            lhs.image == rhs.image
    }
}
