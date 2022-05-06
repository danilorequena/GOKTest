//
//  DigioCollectionView.swift
//  GOKTest
//
//  Created by Danilo Requena on 06/05/22.
//

import UIKit

public final class DigioCollectionView: UIView {
    // MARK: - Getters

    public var indexPathsForSelectedItems: [IndexPath]? {
        collectionView.indexPathsForSelectedItems
    }

    public var visibleCells: [UICollectionViewCell] {
        collectionView.visibleCells
    }

    // MARK: - Getters / Setters

    override public var clipsToBounds: Bool {
        get { collectionView.clipsToBounds }
        set {
            super.clipsToBounds = newValue
            collectionView.clipsToBounds = newValue
        }
    }

    public var contentOffset: CGPoint {
        get { collectionView.contentOffset }
        set { collectionView.contentOffset = newValue }
    }

    public var alwaysBounceVertical: Bool {
        get { collectionView.alwaysBounceVertical }
        set { collectionView.alwaysBounceVertical = newValue }
    }

    public var refreshControl: UIRefreshControl? {
        get { collectionView.refreshControl }
        set { collectionView.refreshControl = newValue }
    }

    public var isScrollEnabled: Bool {
        get { collectionView.isScrollEnabled }
        set { collectionView.isScrollEnabled = newValue }
    }

    public var isPagingEnabled: Bool {
        get { collectionView.isPagingEnabled }
        set { collectionView.isPagingEnabled = newValue }
    }

    public var bounces: Bool {
        get { collectionView.bounces }
        set { collectionView.bounces = newValue }
    }

    public var estimatedItemSize: CGSize {
        get { flowLayout.estimatedItemSize }
        set { flowLayout.estimatedItemSize = newValue }
    }

    public var allowsMultipleSelection: Bool {
        get { collectionView.allowsMultipleSelection }
        set { collectionView.allowsMultipleSelection = newValue }
    }

    public var showsHorizontalScrollIndicator: Bool {
        get { collectionView.showsHorizontalScrollIndicator }
        set { collectionView.showsHorizontalScrollIndicator = newValue }
    }

    public var showsVerticalScrollIndicator: Bool {
        get { collectionView.showsVerticalScrollIndicator }
        set { collectionView.showsVerticalScrollIndicator = newValue }
    }

    public var contentInset: UIEdgeInsets {
        get { collectionView.contentInset }
        set { collectionView.contentInset = newValue }
    }

    public var contentInsetAdjustmentBehavior: UIScrollView.ContentInsetAdjustmentBehavior {
        get { collectionView.contentInsetAdjustmentBehavior }
        set { collectionView.contentInsetAdjustmentBehavior = newValue }
    }

    // MARK: - Properties

    public let flowLayout: UICollectionViewFlowLayout

    public var scrollDirection: UICollectionView.ScrollDirection = .vertical {
        didSet {
            flowLayout.scrollDirection = scrollDirection
            let isVertical = (scrollDirection == .vertical)
            collectionView.showsHorizontalScrollIndicator = false
            collectionView.showsVerticalScrollIndicator = false
            collectionView.alwaysBounceVertical = isVertical
            collectionView.alwaysBounceHorizontal = !isVertical
            collectionView.allowsSelection = true
        }
    }

    private let dataSource: DigioCollectionViewDataSource
    private var sections: [Section]

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.accessibilityIdentifier = "digioCollectionView"
        collectionView.keyboardDismissMode = .onDrag
        collectionView.allowsMultipleSelection = false
        return collectionView
    }()

    // MARK: - Initializer

    public init(
        sections: [Section],
        contentInset: UIEdgeInsets = .zero,
        flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout(),
        minimumCellSpacing: CGFloat = 25,
        minimumInterItemSpacing: CGFloat = 16
    ) {
        self.sections = sections
        self.flowLayout = flowLayout
        self.flowLayout.minimumInteritemSpacing = minimumInterItemSpacing
        self.flowLayout.minimumLineSpacing = minimumCellSpacing
        dataSource = DigioCollectionViewDataSource(sections: sections)
        super.init(frame: .zero)
        setupView()
        collectionView.delegate = dataSource
        collectionView.dataSource = dataSource

        self.contentInset = contentInset
        sections.forEach { section in
            section.register(collectionView)
        }
    }

    @available(*, unavailable)
    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Functions

    public func update(sections: [Section]) {
        self.sections = sections
        dataSource.sections = sections

        sections.forEach { section in
            section.register(collectionView)
        }

        collectionView.reloadData()
    }

    public func updateCollection(rows: [IndexPath]) {
        if #available(iOS 15.0, *) {
            collectionView.reconfigureItems(at: rows)
        }
    }

    public func add(section: Section) -> Bool {
        guard sections.firstIndex(where: { $0 === section }) == nil else {
            return false
        }

        sections.append(section)
        dataSource.sections = sections

        sections.forEach { section in
            section.register(collectionView)
        }

        collectionView.insertSections(IndexSet([sections.count - 1]))
        return true
    }

    public func remove(section: Section) -> Bool {
        guard let index = sections.firstIndex(where: { $0 === section }) else {
            return false
        }

        sections.remove(at: index)
        dataSource.sections = sections

        sections.forEach { section in
            section.register(collectionView)
        }

        collectionView.deleteSections(IndexSet([index]))
        return true
    }

    public func selectItem(
        at indexPath: IndexPath,
        animated: Bool = false,
        scrollPosition: UICollectionView.ScrollPosition
    ) {
        collectionView.selectItem(at: indexPath, animated: animated, scrollPosition: scrollPosition)
    }

    public func deselectItem(at indexPath: IndexPath, animated: Bool = false) {
        collectionView.deselectItem(at: indexPath, animated: animated)
    }

    public func setIdentifier(_ accessibilityIdentifier: String) {
        collectionView.accessibilityIdentifier = accessibilityIdentifier
    }

    public func setBackground(_ color: UIColor) {
        backgroundColor = color
        collectionView.backgroundColor = color
    }

    public func setBackground(view: UIView) {
        collectionView.backgroundView = view
    }

    public func setDelegate(_ collectionViewDataSource: DigioCollectionViewDelegateProtocol) {
        dataSource.collectionViewDelegate = collectionViewDataSource
    }

    public func getNumberOfItems(inSection section: Int) -> Int {
        collectionView.numberOfItems(inSection: section)
    }

    public func setContentOffset(contentOffset: CGPoint, animated: Bool) {
        collectionView.setContentOffset(contentOffset, animated: animated)
    }

    public func performBatchUpdates(_ updates: (() -> Void)?, completion: ((Bool) -> Void)?) {
        collectionView.performBatchUpdates(updates, completion: completion)
    }

    public func deleteItems(at indexPaths: [IndexPath]) {
        collectionView.deleteItems(at: indexPaths)
    }

    public func insertItems(at indexPaths: [IndexPath]) {
        collectionView.insertItems(at: indexPaths)
    }

    public func reloadItems(at indexPaths: [IndexPath]) {
        collectionView.reloadItems(at: indexPaths)
    }
}

// MARK: - CodeView -

extension DigioCollectionView: CodeView {
    public func buildViewHierarchy() {
        addSubview(collectionView)
    }

    public func setupConstraints() {
        collectionView.bindFrameToSuperviewBounds()
    }
}

