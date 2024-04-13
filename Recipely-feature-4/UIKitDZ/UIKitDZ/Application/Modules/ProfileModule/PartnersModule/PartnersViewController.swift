// PartnersViewController.swift
// Copyright © RoadMap. All rights reserved.

import CoreLocation
import GoogleMaps
import UIKit

/// Интерфейс взаимодействия с view
protocol PartnersViewControllerProtocol: AnyObject {
    /// Закрывает текущий экран
    func closeScreen()
    /// Показывает заглушку с информацией
    func openInfoAdress(info: Location)
}

/// Партнеры приложения
class PartnersViewController: UIViewController {
    // MARK: - Visual Components

    private let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Our Partners"
        label.textAlignment = .center
        label.font = UIFont(name: "Verdana-bold", size: 20)
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "You can get gifts and discounts from our partners"
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont(name: "Verdana", size: 18)
        return label
    }()

    private lazy var xButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(dismissScreen), for: .touchUpInside)
        return button
    }()

    private lazy var okButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 12
        button.setTitle("Ok", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .loginButtonBackground
        button.addTarget(self, action: #selector(dismissScreen), for: .touchUpInside)
        return button
    }()

    private lazy var locationButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 26
        button.backgroundColor = .white
        button.setImage(UIImage(named: "locationButtonClear"), for: .normal)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 1)
        button.layer.shadowRadius = 0.7
        button.layer.shadowOpacity = 0.5
        button.addTarget(self, action: #selector(locationTapped), for: .touchUpInside)
        return button
    }()

    private let blueMarkerImageView: UIImageView = {
        let blueMarkerImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        blueMarkerImageView.image = .bluePin
        return blueMarkerImageView
    }()

    private let redMarkerImageView: UIImageView = {
        let redMarkerImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        redMarkerImageView.image = .redPin
        return redMarkerImageView
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        showInitialPosition()
        configureLocationManager()
        setupUI()
        configureConstraints()
        googleMapView.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        navigationItem.hidesBackButton = true
    }

    // MARK: - Private Properties

    private var initialCoordinates = CLLocationCoordinate2D(latitude: 48.482, longitude: 135.084)
    private let googleMapView = GMSMapView()
    private let allLocations = Location.setupData()
    private var allMarkers: [GMSMarker] = []
    private var lastSelectedMarkerTitle = ""
    private var currentSelectedMarkerTitle = ""

    // MARK: - Public Properties

    var presenter: PartnersPresenterProtocol?
    var locationManager: CLLocationManager?

    // MARK: - Private Methods

    private func setupUI() {
        view.addSubviews([googleMapView, mainLabel, xButton, okButton, descriptionLabel])
        googleMapView.addSubviews([locationButton])
    }

    private func showInitialPosition() {
        let camera = GMSCameraPosition(target: initialCoordinates, zoom: 10)
        googleMapView.camera = camera
    }

    private func addBlueMarker(cooridinates: CLLocationCoordinate2D) {
        let marker = GMSMarker(position: cooridinates)
        marker.icon = GMSMarker.markerImage(with: .blue)
        marker.title = "ПОМОЙКА"
        marker.snippet = "ТУТ ВОНЯЕТ ЖЕСТКО НЕ ХОДИТЕ СЮДА"
        marker.map = googleMapView
    }

    private func addOtherMarkers() {
        for location in allLocations {
            let marker = GMSMarker(position: location.coordinate)
            marker.title = location.title
            marker.map = googleMapView
            allMarkers.append(marker)
        }
    }

    private func moveToLocation(coordinates: CLLocationCoordinate2D?) {
        guard let coordinates = coordinates else { return }
        googleMapView.animate(to: GMSCameraPosition(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude,
            zoom: 12
        ))
        addBlueMarker(cooridinates: coordinates)
        addOtherMarkers()
    }

    private func configureLocationManager() {
        locationManager = CLLocationManager()
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.delegate = self
    }

    private func configureConstraints() {
        configureMainLabelConstraints()
        configureGoogleMapViewConstraints()
        configureDescriptionLabelConstraints()
        configureXButtonConstraints()
        configureOkButtonConstraints()
        configureLocationButtonConstraints()
    }

    private func configureMainLabelConstraints() {
        mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        mainLabel.widthAnchor.constraint(equalToConstant: 220).isActive = true
        mainLabel.heightAnchor.constraint(equalToConstant: 28).isActive = true
    }

    private func configureGoogleMapViewConstraints() {
        googleMapView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        googleMapView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        googleMapView.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 25)
            .isActive = true
        googleMapView.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -40).isActive = true
    }

    private func configureDescriptionLabelConstraints() {
        descriptionLabel.bottomAnchor.constraint(equalTo: okButton.topAnchor, constant: -60).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: okButton.leadingAnchor).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: okButton.trailingAnchor).isActive = true
    }

    private func configureXButtonConstraints() {
        xButton.translatesAutoresizingMaskIntoConstraints = false
        xButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -22)
            .isActive = true
        xButton.centerYAnchor.constraint(equalTo: mainLabel.centerYAnchor, constant: 2).isActive = true
        xButton.widthAnchor.constraint(equalToConstant: 19).isActive = true
        xButton.heightAnchor.constraint(equalToConstant: 19).isActive = true
    }

    private func configureOkButtonConstraints() {
        okButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        okButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        okButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -71).isActive = true
        okButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }

    private func configureLocationButtonConstraints() {
        locationButton.bottomAnchor.constraint(equalTo: googleMapView.bottomAnchor, constant: -14).isActive = true
        locationButton.trailingAnchor.constraint(equalTo: googleMapView.trailingAnchor, constant: -14).isActive = true
        locationButton.widthAnchor.constraint(equalToConstant: 52).isActive = true
        locationButton.heightAnchor.constraint(equalToConstant: 52).isActive = true
    }

    private func selectCurrentMarker() {
        lastSelectedMarkerTitle = currentSelectedMarkerTitle
        if let currentMarker = allMarkers.first(where: { $0.title == self.currentSelectedMarkerTitle }) {
            currentMarker.icon = GMSMarker.markerImage(with: .blue)
        }
    }

    private func unselectLastMarker() {
        if let lastMarker = allMarkers.first(where: { $0.title == self.lastSelectedMarkerTitle }) {
            lastMarker.icon = GMSMarker.markerImage(with: .red)
        }
    }

    @objc private func dismissScreen() {
        print("DISMISS")
        presenter?.closeScreen()
    }

    @objc private func locationTapped() {
        locationManager?.requestLocation()
        locationButton.setImage(UIImage(named: "locationButtonBlack"), for: .normal)
    }
}

// MARK: - PartnerView + CLLocationManagerDelegate

extension PartnersViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        moveToLocation(coordinates: locations.first?.coordinate)
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print(error)
    }
}

extension PartnersViewController: PartnersViewControllerProtocol {
    func openInfoAdress(info: Location) {
        let locationDetailViewController = LocationDetailsViewController()
        locationDetailViewController.adressInfo = info
        locationDetailViewController.setColorHandler = { [weak self] in
            guard let self = self else { return }
            self.unselectLastMarker()
        }
        if let sheet = locationDetailViewController.sheetPresentationController {
            sheet.detents = [.custom { _ in 230 }]
        }
        present(locationDetailViewController, animated: true)
    }

    func closeScreen() {
        navigationController?.popViewController(animated: true)
    }
}

extension PartnersViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        if let tappedMarkInfo = allLocations.first(where: { $0.title == marker.title }) {
            currentSelectedMarkerTitle = tappedMarkInfo.title
            selectCurrentMarker()
            presenter?.loadInfoFromMark(info: tappedMarkInfo)
        }
        return true
    }
}
