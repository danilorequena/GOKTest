//
//  SpotlightSectionSpec.swift
//  GOKUnitSpecs
//
//  Created by Danilo Requena on 09/05/22.
//

@testable
import GOKTest
import Nimble
import Quick

final class SpotlightSectionSpec: QuickSpec {
    override func spec() {
        describe("SpotlightSection") {
            var collectionView: UICollectionView!
            var sut: SpotlightViewSection!
            var delegateMock: SpotlightSectionDelegateMock!
            
            beforeEach {
                delegateMock = .init()
                collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
                sut = .init(spotlights: Spotlight.mockArray())
                sut.delegate = delegateMock
            }
            
            describe("cellSize(with:at:)") {
                let bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
                var size: CGSize!

                beforeEach {
                    size = sut.cellSize(with: bounds, at: IndexPath())
                }

                it("has to have the correct size") {
                    expect(size.width) == 68
                    expect(size.height) == 180
                }
            }
            
            describe("headerSize(width:in:)") {
                var size: CGSize!

                beforeEach {
                    size = sut.headerSize(width: 100, in: 0)
                }

                it("has to have the correct size") {
                    expect(size.width).to(equal(.zero))
                    expect(size.height).to(equal(.zero))
                }
            }
            
            describe("headerInsets(in:)") {
                var insets: UIEdgeInsets!

                beforeEach {
                    insets = sut.sectionInsets(in: 0)
                }

                it("has to have the correct insets") {
                    expect(insets) == .zero
                }
            }

            describe("numberOfItemsInSection") {
                it("has to return two") {
                    expect(sut.numberOfItemsInSection()).to(equal(3))
                }
            }
            
            describe("collectionView(_:didSelectItemAt:)") {
                beforeEach {
                    sut.collectionView(collectionView, didSelectItemAt: IndexPath(row: 0, section: 0))
                }

                it("has to invoke delegate to select banner") {
                    expect(delegateMock.hasCalledDidSelectSpotlight) == true
                }
            }
            
            describe("collectionView(_:cellForItemAt:)") {
                var cell: UICollectionViewCell!

                beforeEach {
                    sut.register(collectionView)
                }

                context("when banner is of type 1") {
                    it("has to have a correct type") {
                        cell = sut.collectionView(collectionView, cellForItemAt: IndexPath(row: 1, section: 0))
                        expect(cell).to(beAnInstanceOf(SpotlightCollectionViewCell.self))
                    }
                }

                context("when banner is of type 2") {
                    it("has to have a correct type") {
                        cell = sut.collectionView(collectionView, cellForItemAt: IndexPath(row: 0, section: 0))
                        expect(cell).to(beAnInstanceOf(SpotlightCollectionViewCell.self))
                    }
                }

                context("when banner is of type 3") {
                    it("has to have a correct type") {
                        cell = sut.collectionView(collectionView, cellForItemAt: IndexPath(row: 2, section: 0))
                        expect(cell).to(beAnInstanceOf(SpotlightCollectionViewCell.self))
                    }
                }
            }
        }
    }
}
