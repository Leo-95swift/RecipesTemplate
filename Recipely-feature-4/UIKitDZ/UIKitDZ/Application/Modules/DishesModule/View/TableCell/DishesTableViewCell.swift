// DishesTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран с блюдами выбранной категории
final class DishesTableViewCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let identifier = "DishTableCell"

        enum Texts {
            static let verdanaFont = "Verdana"
            static let verdanaBoldFont = "Verdana-Bold"
        }

        enum ImageNames {
            static let timerImageName = "timer"
            static let caloriesImageName = "pizza"
            static let arrowImageName = "chevron.right"
        }
    }

    // MARK: - Visual Components

    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .myLightGray
        view.layer.cornerRadius = 12
        return view
    }()

    private let dishImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 12
        imageView.layer.masksToBounds = true
        return imageView
    }()

    private let dishNameLabel: UILabel = {
        let label = UILabel()
        label.font = .myFont(fontName: Constants.Texts.verdanaFont, fontSize: 14)
        label.text = ProfileStorage.Constants.defaultUsername
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()

    private let timerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: Constants.ImageNames.timerImageName)
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .black
        return imageView
    }()

    private let timerNumberLabel: UILabel = {
        let label = UILabel()
        label.font = .myFont(fontName: Constants.Texts.verdanaFont, fontSize: 12)
        return label
    }()

    private let caloriesImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.ImageNames.caloriesImageName)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private let caloriesCountLabel: UILabel = {
        let label = UILabel()
        label.font = .myFont(fontName: Constants.Texts.verdanaFont, fontSize: 12)
        return label
    }()

    private let arrowImageVIew: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: Constants.ImageNames.arrowImageName)
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .black
        return imageView
    }()

    // MARK: - Initalizers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSubviews()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        dishImageView.image = nil
    }

    // MARK: - Public Methods

    func configureCell(info: Dish) {
        DispatchQueue.main.async {
            self.loadImage(
                with: info.dishImageName,
                imageID: info.dishName
            )
            self.dishNameLabel.text = info.dishName
            self.timerNumberLabel.text = self.roundAndConvertToString(
                info.cookTime
            ) + " min"
            self.caloriesCountLabel.text = self.roundAndConvertToString(
                info.totalWeight
            ) + " kkal"
        }
    }

    private func loadImage(with stringURL: String, imageID: String) {
        let imageService = LoadImageService()
        let proxy = Proxy(service: imageService)

        guard let url = URL(string: stringURL) else { return }
        proxy.loadImage(url: url, imageId: imageID) { [weak self] data, _, _ in
            guard let self = self,
                  let data = data
            else { return }

            DispatchQueue.main.async {
                self.dishImageView.image = UIImage(data: data)
            }
        }
    }

    // MARK: - Private Methodes

    private func setupSubviews() {
        contentView.addSubviews([containerView], prepareForAutolayout: true)
        containerView.addSubviews([
            dishImageView,
            dishNameLabel,
            timerImageView,
            timerNumberLabel,
            caloriesImageView,
            caloriesCountLabel,
            arrowImageVIew
        ])
    }

    private func setupConstraints() {
        setupContainerViewConstraints()
        setupDishImageViewConstraints()
        setupDishNameLabelConstraints()
        setupTimerImageViewConstraints()
        setupTimerNumberLabelConstraints()
        setupCaloriesImageViewConstraints()
        setupCaloriesCountLabelConstraints()
        setupArrowImageView()
    }

    private func roundAndConvertToString(_ value: Double) -> String {
        let roundedValue = value.rounded()
        let stringValue = String(Int(roundedValue))
        return stringValue
    }

    private func setupContainerViewConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 350),
            containerView.heightAnchor.constraint(equalToConstant: 100),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }

    private func setupDishImageViewConstraints() {
        NSLayoutConstraint.activate([
            dishImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            dishImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            dishImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
            dishImageView.widthAnchor.constraint(equalToConstant: 80),
            dishImageView.heightAnchor.constraint(equalToConstant: 80),
        ])
    }

    private func setupDishNameLabelConstraints() {
        NSLayoutConstraint.activate([
            dishNameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 22),
            dishNameLabel.leadingAnchor.constraint(equalTo: dishImageView.trailingAnchor, constant: 20),
            dishNameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -43),
            dishNameLabel.heightAnchor.constraint(equalToConstant: 32),
            dishNameLabel.widthAnchor.constraint(equalToConstant: 197),
        ])
    }

    private func setupTimerImageViewConstraints() {
        NSLayoutConstraint.activate([
            timerImageView.topAnchor.constraint(equalTo: dishNameLabel.bottomAnchor, constant: 8),
            timerImageView.leadingAnchor.constraint(equalTo: dishImageView.trailingAnchor, constant: 20),
            timerImageView.heightAnchor.constraint(equalToConstant: 15),
            timerImageView.widthAnchor.constraint(equalToConstant: 15),
        ])
    }

    private func setupTimerNumberLabelConstraints() {
        NSLayoutConstraint.activate([
            timerNumberLabel.leadingAnchor.constraint(equalTo: timerImageView.trailingAnchor, constant: 4),
            timerNumberLabel.centerYAnchor.constraint(equalTo: timerImageView.centerYAnchor),
            timerNumberLabel.heightAnchor.constraint(equalToConstant: 15),
            timerNumberLabel.widthAnchor.constraint(equalToConstant: 55),
        ])
    }

    private func setupCaloriesImageViewConstraints() {
        NSLayoutConstraint.activate([
            caloriesImageView.topAnchor.constraint(equalTo: dishNameLabel.bottomAnchor, constant: 8),
            caloriesImageView.leadingAnchor.constraint(equalTo: timerNumberLabel.trailingAnchor, constant: 10),
            caloriesImageView.heightAnchor.constraint(equalToConstant: 15),
            caloriesImageView.widthAnchor.constraint(equalToConstant: 15),
        ])
    }

    private func setupCaloriesCountLabelConstraints() {
        NSLayoutConstraint.activate([
            caloriesCountLabel.leadingAnchor.constraint(equalTo: caloriesImageView.trailingAnchor, constant: 4),
            caloriesCountLabel.centerYAnchor.constraint(equalTo: caloriesImageView.centerYAnchor),
            caloriesCountLabel.heightAnchor.constraint(equalToConstant: 15),
            caloriesCountLabel.widthAnchor.constraint(equalToConstant: 71.85),
        ])
    }

    private func setupArrowImageView() {
        NSLayoutConstraint.activate([
            arrowImageVIew.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            arrowImageVIew.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -13.33),
            arrowImageVIew.heightAnchor.constraint(equalToConstant: 12.35),
            arrowImageVIew.widthAnchor.constraint(equalToConstant: 20),
        ])
    }
}
