//
//  DayForecastCell.swift
//  WeatherApp
//
//  Created by Stanley Traub on 10/31/20.
//

import UIKit

class DayForecastCell: UITableViewCell {
    //MARK: - Properties
    
    static let identifier = "DayForecastCell"
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 50, height: 50)
        layout.minimumLineSpacing = 10
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(TemperatureCell.self, forCellWithReuseIdentifier: TemperatureCell.identifier)
        cv.backgroundColor = #colorLiteral(red: 0.1126087531, green: 0.6826415658, blue: 0.9713730216, alpha: 1)
        return cv
    }()
    
//    private let separatorView = UIView()
    
    //MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    private func configureUI() {
        
        collectionView.dataSource = self
        collectionView.delegate = self
        selectionStyle = .none
        
        addSubview(collectionView)
        collectionView.fillSuperview()
    }
}


extension DayForecastCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TemperatureCell.identifier, for: indexPath) as! TemperatureCell
        return cell
    }
}

//MARK: - UICollectionViewDelegate

extension DayForecastCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
}
