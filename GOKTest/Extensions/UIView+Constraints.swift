//
//  UIView+Constraints.swift
//  GOKTest
//
//  Created by Danilo Requena on 06/05/22.
//

import UIKit

public typealias NSLayoutDimensionHeightAndWidth = (NSLayoutConstraint?, NSLayoutConstraint?)
public typealias NSLayoutConstraintXAndY = (NSLayoutConstraint?, NSLayoutConstraint?)

extension UIView {
    private func disableAutoresizingMaskAndActivate(constraint: NSLayoutConstraint, priority: UILayoutPriority) {
        translatesAutoresizingMaskIntoConstraints = false
        constraint.priority = priority
        constraint.isActive = true
    }

    @discardableResult
    public func anchorTopGreaterThanOrEqualTo(
        constant: CGFloat,
        to anchor: NSLayoutYAxisAnchor,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false

        let topConstraint = topAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
        topConstraint.priority = priority
        topConstraint.isActive = true

        return topConstraint
    }

    @discardableResult
    public func anchorTopLessThanOrEqualTo(
        constant: CGFloat,
        to anchor: NSLayoutYAxisAnchor,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint {
        let topConstraint = topAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
        disableAutoresizingMaskAndActivate(constraint: topConstraint, priority: priority)

        return topConstraint
    }

    @discardableResult
    public func anchorBottomGreaterThanOrEqualTo(
        constant: CGFloat,
        to anchor: NSLayoutYAxisAnchor,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint {
        let topConstraint = bottomAnchor.constraint(greaterThanOrEqualTo: anchor, constant: -constant)
        disableAutoresizingMaskAndActivate(constraint: topConstraint, priority: priority)

        return topConstraint
    }

    @discardableResult
    public func anchorHeightLessThanOrEqualTo(_ dimension: NSLayoutDimension, multiplier: CGFloat = 1.0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false

        let heightConstraint = heightAnchor.constraint(lessThanOrEqualTo: dimension, multiplier: multiplier)
        heightConstraint.isActive = true

        return heightConstraint
    }

    @discardableResult
    public func anchorBottomLessThanOrEqualTo(
        _ anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>,
        constant: CGFloat = 0.0,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint? {
        let bottomConstraint = bottomAnchor.constraint(lessThanOrEqualTo: anchor, constant: -constant)
        disableAutoresizingMaskAndActivate(constraint: bottomConstraint, priority: priority)

        return bottomConstraint
    }

    @discardableResult
    public func anchorLeadingLessThanOrEqualTo(
        _ anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>,
        constant: CGFloat = 0.0,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint {
        let leadingConstraint = leadingAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
        disableAutoresizingMaskAndActivate(constraint: leadingConstraint, priority: priority)

        return leadingConstraint
    }

    @discardableResult
    public func anchorLeadingGreaterThanOrEqualTo(
        _ anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>,
        constant: CGFloat = 0.0,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint {
        let leadingConstraint = leadingAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
        disableAutoresizingMaskAndActivate(constraint: leadingConstraint, priority: priority)

        return leadingConstraint
    }

    @discardableResult
    public func anchorTrailingLessThanOrEqualTo(
        _ anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>,
        constant: CGFloat = 0.0,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint {
        let trailingConstraint = trailingAnchor.constraint(lessThanOrEqualTo: anchor, constant: -constant)
        disableAutoresizingMaskAndActivate(constraint: trailingConstraint, priority: priority)

        return trailingConstraint
    }

    @discardableResult
    public func anchorTrailingGreaterThanOrEqualTo(
        _ anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>,
        constant: CGFloat = 0.0,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint {
        let trailingConstraint = trailingAnchor.constraint(greaterThanOrEqualTo: anchor, constant: -constant)
        disableAutoresizingMaskAndActivate(constraint: trailingConstraint, priority: priority)

        return trailingConstraint
    }

    @discardableResult
    public func anchor(
        top: NSLayoutYAxisAnchor? = nil,
        leading: NSLayoutXAxisAnchor? = nil,
        bottom: NSLayoutYAxisAnchor? = nil,
        trailing: NSLayoutXAxisAnchor? = nil,
        priority: UILayoutPriority = .required,
        insets: UIEdgeInsets = .zero
    ) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false

        var anchors = [NSLayoutConstraint]()

        if let top = top {
            anchors.append(topAnchor.constraint(equalTo: top, constant: insets.top))
        }

        if let leading = leading {
            anchors.append(leadingAnchor.constraint(equalTo: leading, constant: insets.left))
        }

        if let bottom = bottom {
            anchors.append(bottomAnchor.constraint(equalTo: bottom, constant: -insets.bottom))
        }

        if let trailing = trailing {
            anchors.append(trailingAnchor.constraint(equalTo: trailing, constant: -insets.right))
        }

        anchors.forEach { $0.priority = priority }
        NSLayoutConstraint.activate(anchors)

        return anchors
    }

    @discardableResult
    public func anchor(
        height: CGFloat? = nil,
        width: CGFloat? = nil,
        priority: UILayoutPriority = .required
    ) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false

        var anchors = [NSLayoutConstraint]()

        if let width = width {
            anchors.append(widthAnchor.constraint(equalToConstant: width))
        }

        if let height = height {
            anchors.append(heightAnchor.constraint(equalToConstant: height))
        }

        anchors.forEach { $0.priority = priority }
        NSLayoutConstraint.activate(anchors)

        return anchors
    }

    @discardableResult
    public func anchor(aspectRatio: CGFloat, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = widthAnchor.constraint(equalTo: heightAnchor, multiplier: aspectRatio)
        disableAutoresizingMaskAndActivate(constraint: constraint, priority: priority)

        return constraint
    }

    @discardableResult
    public func anchor(
        heightAnchor: NSLayoutDimension? = nil,
        heightMultiplier: CGFloat = 1,
        widthAnchor: NSLayoutDimension? = nil,
        widthMultiplier: CGFloat = 1
    ) -> NSLayoutDimensionHeightAndWidth {
        translatesAutoresizingMaskIntoConstraints = false

        var heightConstraint: NSLayoutConstraint?
        var widthConstraint: NSLayoutConstraint?

        if let heightAnchor = heightAnchor {
            heightConstraint = self.heightAnchor.constraint(equalTo: heightAnchor, multiplier: heightMultiplier)
            heightConstraint?.isActive = true
        }

        if let widthAnchor = widthAnchor {
            widthConstraint = self.widthAnchor.constraint(equalTo: widthAnchor, multiplier: widthMultiplier)
            widthConstraint?.isActive = true
        }

        return (heightConstraint, widthConstraint)
    }

    @discardableResult
    public func anchorLessThanOrEqualTo(
        heightAnchor: NSLayoutDimension? = nil,
        heightMultiplier: CGFloat = 1,
        widthAnchor: NSLayoutDimension? = nil,
        widthMultiplier: CGFloat = 1
    ) -> NSLayoutDimensionHeightAndWidth {
        translatesAutoresizingMaskIntoConstraints = false

        var heightConstraint: NSLayoutConstraint?
        var widthConstraint: NSLayoutConstraint?

        if let heightAnchor = heightAnchor {
            heightConstraint = anchorHeightLessThanOrEqualTo(heightAnchor, multiplier: heightMultiplier)
        }

        if let widthAnchor = widthAnchor {
            widthConstraint = self.widthAnchor.constraint(lessThanOrEqualTo: widthAnchor, multiplier: widthMultiplier)
            widthConstraint?.isActive = true
        }

        return (heightConstraint, widthConstraint)
    }

    @discardableResult
    public func anchorGreaterThanOrEqualTo(
        heightAnchor: NSLayoutDimension? = nil,
        heightConstant: CGFloat = 0,
        widthAnchor: NSLayoutDimension? = nil,
        widthConstant: CGFloat = 0
    ) -> NSLayoutDimensionHeightAndWidth {
        translatesAutoresizingMaskIntoConstraints = false

        var heightConstraint: NSLayoutConstraint?
        var widthConstraint: NSLayoutConstraint?

        if let heightAnchor = heightAnchor {
            heightConstraint = self.heightAnchor.constraint(
                greaterThanOrEqualTo: heightAnchor,
                multiplier: 1,
                constant: heightConstant
            )
            heightConstraint?.isActive = true
        }

        if let widthAnchor = widthAnchor {
            widthConstraint = self.widthAnchor.constraint(
                greaterThanOrEqualTo: widthAnchor,
                multiplier: 1,
                constant: widthConstant
            )
            widthConstraint?.isActive = true
        }

        return (heightConstraint, widthConstraint)
    }

    @discardableResult
    public func anchorHeightGreaterThanOrEqualTo(constant: CGFloat = 0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let heightConstraint = heightAnchor.constraint(greaterThanOrEqualToConstant: constant)
        disableAutoresizingMaskAndActivate(constraint: heightConstraint, priority: priority)

        return heightConstraint
    }

    @discardableResult
    public func anchorWidthGreaterThanOrEqualTo(constant: CGFloat = 0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let widthConstraint = widthAnchor.constraint(greaterThanOrEqualToConstant: constant)
        disableAutoresizingMaskAndActivate(constraint: widthConstraint, priority: priority)

        return widthConstraint
    }

    @discardableResult
    public func anchorSameWidthAsSuperview(multiplier: CGFloat = 1.0) -> NSLayoutConstraint? {
        guard let superview = superview else { return nil }
        return anchorSameWidth(as: superview, multiplier: multiplier)
    }

    @discardableResult
    public func anchorSameHeightAsSuperview(multiplier: CGFloat = 1.0) -> NSLayoutConstraint? {
        guard let superview = superview else { return nil }
        return anchorSameHeight(as: superview, multiplier: multiplier)
    }

    @discardableResult
    public func anchorSameWidth(
        as view: UIView,
        multiplier: CGFloat = 1.0,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint {
        let widthConstraint = widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: multiplier)
        disableAutoresizingMaskAndActivate(constraint: widthConstraint, priority: priority)

        return widthConstraint
    }

    @discardableResult
    public func anchorSameHeight(
        as view: UIView,
        multiplier: CGFloat = 1.0,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint {
        let heightConstraint = heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: multiplier)
        disableAutoresizingMaskAndActivate(constraint: heightConstraint, priority: priority)

        return heightConstraint
    }

    @discardableResult
    public func anchorCenterXToSuperview(constant: CGFloat = 0, priority: UILayoutPriority = .required) -> NSLayoutConstraint? {
        guard let superview = superview else { return nil }
        return anchorCenterXTo(view: superview, constant: constant, priority: priority)
    }

    @discardableResult
    public func anchorCenterXTo(view: UIView, constant: CGFloat = 0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let centerXConstraint = centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: constant)
        disableAutoresizingMaskAndActivate(constraint: centerXConstraint, priority: priority)

        return centerXConstraint
    }

    @discardableResult
    public func anchorCenterYTo(view: UIView, constant: CGFloat = 0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let centerYConstraint = centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant)
        disableAutoresizingMaskAndActivate(constraint: centerYConstraint, priority: priority)

        return centerYConstraint
    }

    @discardableResult
    public func anchorCenterYToSuperview(constant: CGFloat = 0, priority: UILayoutPriority = .required) -> NSLayoutConstraint? {
        guard let superview = superview else { return nil }
        return anchorCenterYTo(view: superview, constant: constant, priority: priority)
    }

    @discardableResult
    public func anchorCenterTo(view: UIView, priority: UILayoutPriority = .required) -> NSLayoutConstraintXAndY {
        let centerXConstraint = anchorCenterXTo(view: view, priority: priority)
        let centerYConstraint = anchorCenterYTo(view: view, priority: priority)
        return (centerXConstraint, centerYConstraint)
    }

    @discardableResult
    public func anchorCenterSuperview(priority: UILayoutPriority = .required) -> NSLayoutConstraintXAndY {
        let centerXAnchor = anchorCenterXToSuperview(priority: priority)
        let centerYAnchor = anchorCenterYToSuperview(priority: priority)
        return (centerXAnchor, centerYAnchor)
    }

    public func bindFrameToSuperviewBounds(insets: UIEdgeInsets = .zero) {
        guard let superview = superview else { return }
        anchor(to: superview, insets: insets)
    }

    public func bindFrameToSuperviewSafeBounds(insets: UIEdgeInsets = .zero) {
        guard let superview = superview else { return }
        anchor(
            top: superview.safeAreaLayoutGuide.topAnchor,
            leading: superview.safeAreaLayoutGuide.leadingAnchor,
            bottom: superview.safeAreaLayoutGuide.bottomAnchor,
            trailing: superview.safeAreaLayoutGuide.trailingAnchor,
            insets: insets
        )
    }

    public func anchor(to view: UIView, insets: UIEdgeInsets = .zero) {
        anchor(
            top: view.topAnchor,
            leading: view.leadingAnchor,
            bottom: view.bottomAnchor,
            trailing: view.trailingAnchor,
            insets: insets
        )
    }

    public func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
}
