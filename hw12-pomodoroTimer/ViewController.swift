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

    private var timer = Timer()

    private var counter = 0 {
        willSet {
            timeLabel.text = newValue < 10 ? "00:0\(newValue)" : "00:\(newValue)"
        }
    }

    private var isWorkTime = true {
        willSet {
            timeLabel.text = "\(newValue)"
        }
    }

    private var isStarted = false {
        didSet {
            button.isSelected = isStarted
        }
    }




    // MARK: - Views




    // MARK: - Lifecycle

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
        isWorkTime = true
        counter = 15

        timeLabel.font = .systemFont(ofSize: 34)

        button.setImage(UIImage(systemName: "pause"), for: .selected)
        button.setImage(UIImage(systemName: "play"), for: .normal)


        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

    }

    // MARK: - Actions

    @objc private func buttonAction() {

        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(timerAction),
            userInfo: nil,
            repeats: true
        )

        isStarted = !isStarted
    }

    @objc private func timerAction() {

        guard counter > 0 else {
            isStarted = !isStarted
            isWorkTime = !isWorkTime
            timer.invalidate()
            return
        }

        counter -= 1

        }


}

// MARK: - Constants

extension ViewController {
    enum Metric {
        static let fontsize: CGFloat = 34
        static let buttonTopOffset: CGFloat = 20
        static let workTimeValue: Int = 15
        static let relaxTimeValue: Int = 5
    }

    enum Icon {
        static let pauseIcon = UIImage(systemName: "pause")
        static let startIcon = UIImage(systemName: "play")
    }

    enum Colors {
        static let workStateColor = UIColor.systemRed
        static let relaxStateColor = UIColor.systemGreen
    }
}
