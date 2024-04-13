// TermsOfUseViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Интерфейс взаимодейстствия с вью
protocol TermsOfUseViewControllerProtocol: AnyObject {
    /// Закрывает текущий экран
    func closeScreen()
    /// Обновляет содержимое лейблов
    func setLabelText(info: TermsOfUse)
}

/// Экран с политикой конфиденциальности
final class TermsOfUseViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let verdanaFont = "Verdana"
        static let verdanaBoldFont = "Verdana-Bold"
        static let xButtonImageName = "xmark"
    }

    // MARK: - Visual Components

    private lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .myFont(
            fontName: Constants.verdanaBoldFont,
            fontSize: 20
        )
        return label
    }()

    private lazy var mainTextView: UITextView = {
        let textView = UITextView()
        textView.textColor = .black
        textView.textAlignment = .left
        textView.showsVerticalScrollIndicator = false
        textView.isEditable = false
        textView.font = .myFont(
            fontName: Constants.verdanaFont,
            fontSize: 14
        )
        return textView
    }()

    private lazy var xButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: Constants.xButtonImageName), for: .normal)
        button.contentMode = .scaleAspectFill
        button.tintColor = .black
        button.addTarget(
            self,
            action: #selector(cancelTapped),
            for: .touchUpInside
        )
        return button
    }()

    // MARK: - Private Properties

    var presenter: TermsOfUsePresenterProtocol?

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        configureSubviews()
    }

    // MARK: - Private Methodes

    private func setupSubviews() {
        view.addSubviews([
            mainLabel,
            mainTextView,
            xButton
        ])
        view.backgroundColor = .white
        presenter?.setLabelTexts()
    }

    private func configureSubviews() {
        configureMainLabelConstraints()
        configureMainTextViewConstraints()
        configureXbuttonConstraints()
    }

    @objc private func cancelTapped() {
        presenter?.closeScreen()
    }
}

// MARK: - TermsOfUseViewController + TermsOfUseViewControllerProtocol

extension TermsOfUseViewController: TermsOfUseViewControllerProtocol {
    func closeScreen() {
        dismiss(animated: true)
    }

    func setLabelText(info: TermsOfUse) {
        mainLabel.text = info.title
        mainTextView.text = info.text
    }
}

/// Расширение для установки расположений и размеров UI элементов
extension TermsOfUseViewController {
    private func configureMainLabelConstraints() {
        NSLayoutConstraint.activate([
            mainLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 25
            ),
            mainLabel.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: 45
            ),
            mainLabel.heightAnchor.constraint(
                equalToConstant: 20
            )
        ])
    }

    private func configureMainTextViewConstraints() {
        NSLayoutConstraint.activate([
            mainTextView.leadingAnchor.constraint(
                equalTo: mainLabel.leadingAnchor
            ),
            mainTextView.topAnchor.constraint(
                equalTo: mainLabel.bottomAnchor
            ),
            mainTextView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -25
            ),
            mainTextView.bottomAnchor.constraint(
                equalTo: view.bottomAnchor
            )
        ])
    }

    private func configureXbuttonConstraints() {
        NSLayoutConstraint.activate([
            xButton.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: 15
            ),
            xButton.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -10
            ),
            xButton.widthAnchor.constraint(
                equalToConstant: 24
            ),
            xButton.heightAnchor.constraint(
                equalToConstant: 24
            )
        ])
    }
}
