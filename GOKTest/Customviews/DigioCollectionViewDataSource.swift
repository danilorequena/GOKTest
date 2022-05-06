//
//  DigioCollectionViewDataSource.swift
//  GOKTest
//
//  Created by Danilo Requena on 06/05/22.
//

import UIKit

public protocol Section: AnyObject {
    func numberOfItemsInSection() -> Int
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath)
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool
    func collectionView(_ collectionView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool
    func collectionView(
        _ collectionView: UICollectionView,
        willDisplay cell: UICollectionViewCell,
        forItemAt indexPath: IndexPath
    )
    func register(_ collectionView: UICollectionView)
    func cellSize(with collectionViewBounds: CGRect, at indexPath: IndexPath) -> CGSize
    func sectionInsets(in section: Int) -> UIEdgeInsets
    func headerSize(width: CGFloat, in section: Int) -> CGSize
    func footerSize(width: CGFloat, in section: Int) -> CGSize
    func animateOnTouch(at indexPath: IndexPath) -> Bool
}

extension Section {
    public func animateOnTouch(at _: IndexPath) -> Bool {
        true
    }

    public func collectionView(
        _: UICollectionView,
        viewForSupplementaryElementOfKind _: String,
        at _: IndexPath
    ) -> UICollectionReusableView {
        UICollectionReusableView()
    }

    public func collectionView(_: UICollectionView, didSelectItemAt _: IndexPath) {}

    public func collectionView(_: UICollectionView, didDeselectItemAt _: IndexPath) {}

    public func collectionView(_: UICollectionView, shouldSelectItemAt _: IndexPath) -> Bool {
        true
    }

    public func collectionView(
        _: UICollectionView,
        willDisplay _: UICollectionViewCell,
        forItemAt _: IndexPath
    ) {}

    public func collectionView(_: UICollectionView, shouldDeselectItemAt _: IndexPath) -> Bool {
        true
    }

    public func footerSize(width _: CGFloat, in _: Int) -> CGSize {
        .zero
    }
}

public protocol DigioCollectionViewDelegateProtocol: AnyObject {
    func scrollViewDidScroll(_ scrollView: UIScrollView)
}

public class DigioCollectionViewDataSource: NSObject,
    UICollectionViewDataSource,
    UICollectionViewDelegate,
    UICollectionViewDelegateFlowLayout {
    public weak var collectionViewDelegate: DigioCollectionViewDelegateProtocol?

    var sections: [Section]

    public init(sections: [Section]) {
        self.sections = sections
    }

    public func animateOnTouch(at indexPath: IndexPath) -> Bool {
        sections[indexPath.section].animateOnTouch(at: indexPath)
    }

    public func numberOfSections(in _: UICollectionView) -> Int {
        sections.count
    }

    public func collectionView(_: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].numberOfItemsInSection()
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        sections[indexPath.section].collectionView(collectionView, cellForItemAt: indexPath)
    }

    public func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        sections[indexPath.section].collectionView(collectionView, willDisplay: cell, forItemAt: indexPath)
    }

    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        sections[indexPath.section].collectionView(collectionView, didSelectItemAt: indexPath)
    }

    public func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        sections[indexPath.section].collectionView(collectionView, didDeselectItemAt: indexPath)
    }

    public func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        sections[indexPath.section].collectionView(collectionView, shouldSelectItemAt: indexPath)
    }

    public func collectionView(_ collectionView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool {
        sections[indexPath.section].collectionView(collectionView, shouldDeselectItemAt: indexPath)
    }

    // Altura das headers
    public func collectionView(
        _ collectionView: UICollectionView,
        layout _: UICollectionViewLayout,
        referenceSizeForHeaderInSection section: Int
    ) -> CGSize {
        sections[section].headerSize(width: collectionView.bounds.width, in: section)
    }

    // Altura dos Footers
    public func collectionView(
        _ collectionView: UICollectionView,
        layout _: UICollectionViewLayout,
        referenceSizeForFooterInSection section: Int
    ) -> CGSize {
        sections[section].footerSize(width: collectionView.bounds.width, in: section)
    }

    // Altura das celulas
    public func collectionView(
        _ collectionView: UICollectionView,
        layout _: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        sections[indexPath.section].cellSize(with: collectionView.bounds, at: indexPath)
    }

    // UIEdgeInsets das sections
    public func collectionView(
        _: UICollectionView,
        layout _: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        sections[section].sectionInsets(in: section)
    }

    // UICollectionReusableView
    public func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        sections[indexPath.section].collectionView(collectionView, viewForSupplementaryElementOfKind: kind, at: indexPath)
    }

    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        collectionViewDelegate?.scrollViewDidScroll(scrollView)
    }
}

// Animation on touch
extension DigioCollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        if !animateOnTouch(at: indexPath) { return }
        UIView.animate(withDuration: 0.25) {
            let cell = collectionView.cellForItem(at: indexPath)
            cell?.contentView.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }
    }

    public func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        if !animateOnTouch(at: indexPath) { return }
        UIView.animate(withDuration: 0.25) {
            let cell = collectionView.cellForItem(at: indexPath)
            cell?.contentView.transform = CGAffineTransform.identity
        }
    }
}

