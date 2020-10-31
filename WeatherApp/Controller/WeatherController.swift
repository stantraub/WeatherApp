//
//  WeatherController.swift
//  WeatherApp
//
//  Created by Stanley Traub on 10/31/20.
//

import UIKit

class WeatherController: UITableViewController {
    //MARK: - Properties
    
    private let maxHeaderHeight: CGFloat = 350
    private let minHeaderHeight: CGFloat = 100

    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    //MARK: - Helpers
    
    private func configureTableView() {
        
        tableView.separatorStyle = .none
        tableView.tableHeaderView = WeatherHeader()
        tableView.backgroundColor = #colorLiteral(red: 0.1126087531, green: 0.6826415658, blue: 0.9713730216, alpha: 1)
        
    }
}

//MARK: - UITableViewDelegate/Datasource

extension WeatherController {
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentHeight = maxHeaderHeight - scrollView.contentOffset.y
        if currentHeight > minHeaderHeight {
            tableView.tableHeaderView?.frame = CGRect(x: 0, y: 0, width: 350, height: currentHeight)
        }
    }
}
