//
//  WeatherHeader.swift
//  WeatherApp
//
//  Created by Stanley Traub on 10/31/20.
//

import UIKit

class WeatherHeader: UIView {
    //MARK: - Properties
    
    private let cityLabel: UILabel = {
        let label = UILabel()
        label.text = "San Francisco"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .label
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Mostly sunny"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .secondaryLabel
        return label
    }()
    
    let temperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "55℉"
        label.font = UIFont.systemFont(ofSize: 55)
        label.alpha = 1
        label.textColor = .label
        return label
    }()
    
    private let highLabel: UILabel = {
        let label = UILabel()
        label.text = "68℉"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let lowLabel: UILabel = {
        let label = UILabel()
        label.text = "48℉"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let tableView: UITableView = {
        let tv = UITableView()
        tv.register(DayForecastCell.self, forCellReuseIdentifier: DayForecastCell.identifier)
        tv.rowHeight = 100
        return tv
    }()
    
    private lazy var highLowStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [highLabel, lowLabel])
        return stack
    }()
    
    private lazy var temperatureStack: UIStackView = {

        let temperatureStack = UIStackView(arrangedSubviews: [cityLabel, descriptionLabel, temperatureLabel, highLowStack])
        temperatureStack.axis = .vertical
        temperatureStack.distribution = .fillProportionally
        return temperatureStack
    }()
    
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.setHeight(2)
        return view
    }()
    
    private let height: CGFloat = 350
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    override func layoutSubviews() {
        let alpha: CGFloat = (frame.height - 100) / 350
        temperatureLabel.alpha = alpha
        
        if alpha < 0.66 {
            temperatureLabel.isHidden = true
            highLowStack.isHidden = true
        } else {
            temperatureLabel.isHidden = false
            temperatureLabel.alpha = alpha
            highLowStack.isHidden = false
        }
        
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    private func configureUI() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        addSubview(temperatureStack)
        temperatureStack.centerX(inView: self)
        temperatureStack.anchor(top: topAnchor, paddingTop: 70)

        addSubview(tableView)
        tableView.anchor(top: temperatureStack.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 10)
        tableView.setDimensions(height: 100, width: frame.width)
        
        addSubview(separatorView)
        separatorView.anchor(left: leftAnchor, bottom: tableView.topAnchor, right: rightAnchor)
    }
}

extension WeatherHeader: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DayForecastCell.identifier, for: indexPath) as! DayForecastCell
        return cell
    }
    
    
}
