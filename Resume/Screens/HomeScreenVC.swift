//  Copyright © 2019 mgontar. All rights reserved.

import UIKit
import RxCocoa
import RxSwift
import PureLayout

private enum Constants {
    static let photoImageHeight: CGFloat = CGFloat(180.0)
    static let jobTitleSeparator: String = ", "
}

class HomeScreenVC: UIViewController {
    private let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = Constants.photoImageHeight / 2
        imageView.clipsToBounds = true

        return imageView
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.applyStyle(.header)

        return label
    }()

    private let jobTitleLabel: UILabel = {
        let label = UILabel()
        label.applyStyle(.title)

        return label
    }()

    private let disposeBag = DisposeBag()

    init(viewModel: HomeScreenVM) {
        super.init(nibName: nil, bundle: nil)

        self.view.backgroundColor = .white

        self.setupSubviews()
        self.setupConstraints()
        self.bindModel(viewModel: viewModel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        methodNotImplemented()
    }

    private func setupSubviews() {
        self.view.addSubview(self.photoImageView)
        self.view.addSubview(self.nameLabel)
        self.view.addSubview(self.jobTitleLabel)
    }

    private func setupConstraints() {
        self.photoImageView.autoPinEdge(toSuperviewSafeArea: .top, withInset: Dimensions.Margins.verticalMargin)
        self.photoImageView.autoAlignAxis(toSuperviewAxis: .vertical)
        self.photoImageView.autoSetDimension(.height, toSize: Constants.photoImageHeight)
        self.photoImageView.autoMatch(.width, to: .height, of: self.photoImageView)

        self.nameLabel.autoPinEdge(.top, to: .bottom, of: self.photoImageView, withOffset: Dimensions.Margins.medium)
        self.nameLabel.autoPinEdge(toSuperviewEdge: .left, withInset: Dimensions.Margins.horizontalMargin, relation: .greaterThanOrEqual)
        self.nameLabel.autoPinEdge(toSuperviewEdge: .right, withInset: Dimensions.Margins.horizontalMargin, relation: .greaterThanOrEqual)
        self.nameLabel.autoAlignAxis(toSuperviewAxis: .vertical)

        self.jobTitleLabel.autoPinEdge(.top, to: .bottom, of: self.nameLabel, withOffset: Dimensions.Margins.small)
        self.jobTitleLabel.autoPinEdge(toSuperviewEdge: .left, withInset: Dimensions.Margins.horizontalMargin, relation: .greaterThanOrEqual)
        self.jobTitleLabel.autoPinEdge(toSuperviewEdge: .right, withInset: Dimensions.Margins.horizontalMargin, relation: .greaterThanOrEqual)
        self.jobTitleLabel.autoAlignAxis(toSuperviewAxis: .vertical)

    }

    private func bindModel(viewModel: HomeScreenVM) {
        viewModel.personalPhoto
            .bind(to: self.photoImageView.rx.image)
            .disposed(by: self.disposeBag)

        viewModel.personalData
            .map { $0.name }
            .bind(to: self.nameLabel.rx.text)
            .disposed(by: self.disposeBag)

        viewModel.personalData
            .map { $0.jobTitles?.joined(separator: Constants.jobTitleSeparator) }
            .bind(to: self.jobTitleLabel.rx.text)
            .disposed(by: self.disposeBag)
    }
}
