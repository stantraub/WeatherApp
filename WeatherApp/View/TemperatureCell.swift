//
//  TemperatureCell.swift
//  WeatherApp
//
//  Created by Stanley Traub on 10/31/20.
//

import UIKit

class TemperatureCell: UICollectionViewCell {
    //MARK: - Properties
    
    static let identifier = "TemperatureCell"
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    private func configureUI() {
        backgroundColor = .red
    }
}
