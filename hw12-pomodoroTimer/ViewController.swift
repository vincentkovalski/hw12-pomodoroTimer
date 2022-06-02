//
//  ViewController.swift
//  hw12-pomodoroTimer
//
//  Created by Виктор Ковалевский on 02.06.2022.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties

    private let timeLabel = UILabel()

    private let button = UIButton(type: .system)


    // MARK: - Views




    // MAKR: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupHierarchy()
        setupView()
        setupLayout()
    }


    private func setupHierarchy() {
        view.addSubview(timeLabel)
        view.addSubview(button)

    }

    private func setupLayout() {
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        timeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 20).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

    }

    private func setupView() {

        timeLabel.font = .systemFont(ofSize: 34)

        button.setImage(UIImage(systemName: "pause"), for: .selected)
        button.setImage(UIImage(systemName: "play"), for: .normal)

    }


}

