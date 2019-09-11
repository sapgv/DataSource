//
//  TableViewController.swift
//  DataSource
//
//  Created by Grigoriy Sapogov on 11/09/2019.
//  Copyright © 2019 Sima-Land. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class TableViewController: UITableViewController {

    private var disposeBag = DisposeBag()
    private var viewModel = ViewModel()
    private var dataSource: RxTableViewSectionedAnimatedDataSource<Section> = RxTableViewSectionedAnimatedDataSource<Section>(configureCell: { (ds, tv, ip, row: Row) in
        
        let cell = tv.dequeueReusableCell(withIdentifier: "EditCell", for: ip) as! EditCell
//        cell.textField.placeholder = row.placeholder
        return cell
        
    })
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        bindUI()
        
    }
    
    private func setupTableView() {
       
        tableView.register(EditCell.self, forCellReuseIdentifier: "EditCell")
        tableView.dataSource = nil
        
    }

    private func bindUI() {
        
        
        let open = rx.sentMessage(#selector(UIViewController.viewWillAppear(_:)))
                    .mapToVoid()
                    .asDriverOnErrorJustComplete()
        
        let input = ViewModel.Input(open: open)
        
        let output = viewModel.transform(input: input)
        
        output?.sections
            .drive(tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
        
        
    }
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
