//
//  UIImageView+KingFisher.swift
//  GOKTest
//
//  Created by Danilo Requena on 08/05/22.
//

import Kingfisher

extension UIImageView {
    public func download(from url: String, placeHolder: UIImage? = nil) {
        download(from: URL(string: url), placeHolder: placeHolder)
    }

    public func download(from url: String?, placeHolder: UIImage? = nil) {
        guard let url = url else { return }
        download(from: URL(string: url), placeHolder: placeHolder)
    }

    public func download(from url: String, placeHolder: UIImage? = nil, completion: @escaping (Bool) -> Void) {
        image = placeHolder

        guard let url = URL(string: url) else {
            return
        }

        kf.setImage(with: url, placeholder: placeHolder, completionHandler: { result in
            switch result {
            case .success:
                completion(true)

            case .failure:
                completion(false)
            }
        })
    }

    public func download(from url: URL?, placeHolder: UIImage? = nil) {
        image = placeHolder

        if let url = url {
            kf.setImage(with: url, placeholder: placeHolder)
        }
    }

    public func downloadWithCenterPlaceholder(
        from url: String,
        placeHolder: UIImage,
        placeHolderBackgroundColor: UIColor? = nil,
        successContentMode: UIImageView.ContentMode,
        successBackgroundColor: UIColor = .clear,
        completion: @escaping (Bool) -> Void = { _ in }
    ) {
        contentMode = .center
        clipsToBounds = true
        if let placeHolderBackgroundColor = placeHolderBackgroundColor {
            backgroundColor = placeHolderBackgroundColor
        }

        download(
            from: url,
            placeHolder: placeHolder
        ) { [weak self] success in
            if success {
                self?.contentMode = successContentMode
                self?.backgroundColor = successBackgroundColor
            }
            completion(success)
        }
    }
}
