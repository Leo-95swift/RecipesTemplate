// FavoritesViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Интерфейс взаимодействия с view
protocol FavoritesViewControllerProtocol: AnyObject {
    /// Обновляет у вью данные о выбранных блюд
    func updateFavoritesData(_ data: [Dish])
}

/// Экран для показа избранных рецептов
final class FavoritesViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        enum Insets {
            static let top: CGFloat = 12
            static let leading: CGFloat = 20
            static let trailing: CGFloat = -20
            static let differenceInset: CGFloat = -40
        }

        enum Texts {
            static let txt = "navigations.txt"
            static let content = "Пользователь открыл Экран избранных блюд"
            static let verdanaFont = "Verdana"
            static let verdanaBoldFont = "Verdana-Bold"
        }
    }

    // MARK: Public Properties

    private var favoriteDishes: [Dish] = []
    private var isDataEmpty: Bool = false

    // MARK: Public Properties

    var presenter: FavoritesPresenter?
    var fileManagerService: FileManagerService?

    // MARK: - Visual Components

    private let favoritesBarButtonItem: UIBarButtonItem = {
        let label = UILabel()
        label.text = Local.favoritesModule
        label.font = .systemFont(ofSize: 28, weight: .bold)
        let item = UIBarButtonItem(customView: label)
        return item
    }()

    private let noFavoritesStackView = makeMessageStackView(
        image: .noFavoritesIcon,
        title: Local.FavoritesModule.noFavoriteRecipesText,
        message: Local.FavoritesModule.favoriteRecipesSuggestionText
    )

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(
            DishesTableViewCell.self,
            forCellReuseIdentifier: DishesTableViewCell.Constants.identifier
        )
        tableView.allowsSelection = true
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.dataSource = self
        return tableView
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        configureSubviews()
        presenter?.fetchFavoriteDishes()
        updateDishes()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.fetchFavoriteDishes()
        updateDishes()
        tableView.reloadData()
        fileManagerService?.sendInfoToDirectory(
            txtFileName: Constants.Texts.txt,
            content: Constants.Texts.content
        )
    }

    // MARK: - Private Methodes

    private func setupSubviews() {
        view.addSubviews([
            noFavoritesStackView,
            tableView
        ])
        view.backgroundColor = .white
        navigationItem.leftBarButtonItem = favoritesBarButtonItem
    }

    private func configureSubviews() {
        configureNoFavoritesStackViewConstraints()
        configureTableViewConstraints()
    }

    private func updateDishes() {
        tableView.isHidden = favoriteDishes.isEmpty
        noFavoritesStackView.isHidden = !favoriteDishes.isEmpty
        tableView.reloadData()
    }
}

/// Расширение для установки расположений и размеров UI элементов
extension FavoritesViewController {
    private func configureNoFavoritesStackViewConstraints() {
        NSLayoutConstraint.activate([
            noFavoritesStackView.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),
            noFavoritesStackView.centerYAnchor.constraint(
                equalTo: view.centerYAnchor
            ),
            noFavoritesStackView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.Insets.leading
            ),
            noFavoritesStackView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Constants.Insets.trailing
            ),
            noFavoritesStackView.widthAnchor.constraint(
                equalTo: view.widthAnchor,
                constant: Constants.Insets.differenceInset
            )
        ])
    }

    private func configureTableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.Insets.leading
            ),
            tableView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Constants.Insets.trailing
            ),
            tableView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: Constants.Insets.top
            ),
            tableView.bottomAnchor.constraint(
                equalTo: view.bottomAnchor
            )
        ])
    }
}

// MARK: - FavoritesViewController + UITableViewDataSource

extension FavoritesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favoriteDishes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: DishesTableViewCell.Constants.identifier,
            for: indexPath
        ) as? DishesTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.configureCell(info: favoriteDishes[indexPath.row])
        return cell
    }
}

/// расширение для обнавления блюд
extension FavoritesViewController: FavoritesViewControllerProtocol {
    func updateFavoritesData(_ data: [Dish]) {
        favoriteDishes = data
    }
}
