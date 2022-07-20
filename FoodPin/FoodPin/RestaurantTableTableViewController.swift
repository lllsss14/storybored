//
//  RestaurantTableTableViewController.swift
//  FoodPin
//
//  Created by lishan on 2022/7/19.
//

import UIKit

class RestaurantTableTableViewController: UITableViewController {
    
    /**
     使用UITableViewDiffableDataSource方法在表视图中显示数据的方式。总结一下，以下是我们使用这种新方法的步骤：
     创建一个枚举来指示表格部分。
     创建一个UITableViewDiffableDataSource对象，与您的表连接并提供表视图单元格的配置。
     将可变数据源分配给您的表视图。
     通过创建快照生成表数据的当前状态
     调用数据源的apply()函数来填充数据
     */
    
    enum Section {
        case all
    }
    
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    
    var restaurantImages = ["cafedeadend", "homei", "teakha", "cafeloisl", "petiteoyster", "forkee", "posatelier", "bourkestreetbakery", "haigh", "palomino", "upstate", "traif", "graham", "waffleandwolf", "fiveleaves", "cafelore", "confessional", "barrafina", "donostia", "royaloak", "cask"]

    
    func configureDataSource() -> UITableViewDiffableDataSource<Section, String> {
        //configureDataSource()代表函数名，->代表返回，返回UITableViewDiffableDataSource<Section, String>的实例
        
        //UITableViewDiffableDataSource是一个通用对象，能够处理表视图中不同类型的部分和项。角括号内的Section和String类型表示，我们对表部分使用Section类型，对表单元格数据使用String类型。使用String类型的原因是餐厅名称属于String类型。
        
        let cellIdentifier = "datacell"
        let dataSource = UITableViewDiffableDataSource<Section, String> (
            tableView: tableView, cellProvider: { tableView, IndexPath, restaurantNames in
                let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: IndexPath)
                
                cell.textLabel?.text = restaurantNames
                cell.imageView?.image = UIImage(named: self.restaurantImages[IndexPath.row])
                
                return cell
            })
        
        return dataSource
    }
    
    lazy var dataSource = configureDataSource()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = dataSource
        //将自定义数据源分配给表视图的数据源。
        var snapshot = NSDiffableDataSourceSnapshot<Section, String>()
        //创建要显示在表格视图中的snapshot。snapshot是NSDiffableDataSourceSnapshot的实例。此行代码使用部分标识符类型部分和项目标识符类型字符串创建空snapshot：
        snapshot.appendSections([.all])
        //调用appendSections为snapshot添加一个部分。然后，我们调用appendItems，将 restaurantNames数组中的所有项目添加到.all部分。
        snapshot.appendItems(restaurantNames, toSection: .all)
        //然后，我们调用appendItems，将 restaurantNames数组中的所有项目添加到.all部分。
        dataSource.apply(snapshot, animatingDifferences: false)
        //最后，我们将snapshot应用于数据源。
    }

    
}
