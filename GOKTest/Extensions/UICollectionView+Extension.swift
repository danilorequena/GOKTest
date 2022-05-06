//
//  UICollectionView+Extension.swift
//  GOKTest
//
//  Created by Danilo Requena on 06/05/22.
//

import UIKit

extension UICollectionView {
    public func register<T: UICollectionViewCell>(_: T.Type) {
        register(T.self, forCellWithReuseIdentifier: T.identifier)
    }

    public func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier : \(T.identifier)")
        }

        return cell
    }

    public func register<T: UICollectionReusableView>(_: T.Type, forSupplementaryViewOfKind kind: String) {
        register(T.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: T.identifier)
    }

    public func dequeueReusableSupplementaryView<T: UICollectionReusableView>(ofKind kind: String, forIndexPath indexPath: IndexPath) -> T {
        guard let view = dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier : \(T.identifier)")
        }

        return view
    }
}

