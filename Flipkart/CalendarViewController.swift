//
//  CalendarViewController.swift
//  Flipkart
//
//  Created by CTS BTP5NE18 on 12/7/16.
//  Copyright © 2016 Prashuk. All rights reserved.
//

import UIKit
import JTAppleCalendar

class CalendarViewController: UIViewController {

    @IBOutlet weak var calendarView: JTAppleCalendarView!
    @IBOutlet weak var tableView: UITableView!
    
    var data = [String]()
    
    @IBOutlet weak var dateText: UITextField!
    
    let white = UIColor(colorWithHexValue: 0xECEAED)
    let darkPurple = UIColor(colorWithHexValue: 0x3A284C)
    let dimPurple = UIColor(colorWithHexValue: 0x574865)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        calendarView.dataSource = self
        calendarView.delegate = self
        calendarView.registerCellViewXib(file: "CellView")
        calendarView.cellInset = CGPoint(x: 0, y: 0)
        calendarView.selectDates([NSDate() as Date])
        
//        let doubleTapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didDoubleTapCollectionView(gesture:)))
//        doubleTapGesture.numberOfTapsRequired = 2  // add double tap
//        calendarView.addGestureRecognizer(doubleTapGesture)
        
        tableView.layer.masksToBounds = true
        tableView.layer.borderColor = UIColor.gray.cgColor
        tableView.layer.borderWidth = 1.0
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        let date = NSDate()
        let calendar = NSCalendar.current
        let day = calendar.component(.day, from: date as Date)
        guard let myCustomCell = view as? CellView  else { return }
        if myCustomCell.dayLabel.text == String(day)
        {
            myCustomCell.dayLabel.textColor = white
            myCustomCell.selectedView.isHidden = false
        }
    }
    
//    func didDoubleTapCollectionView(gesture: UITapGestureRecognizer) {
//        let point = gesture.location(in: gesture.view!)
//        let cellState = calendarView.cellStatus(at: point)
//        print(cellState!.date)
//    }
    
    // Function to handle the text color of the calendar
    func handleCellTextColor(view: JTAppleDayCellView?, cellState: CellState) {
        
        guard let myCustomCell = view as? CellView  else { return }
        
        if cellState.isSelected
        {
            myCustomCell.dayLabel.textColor = white
        }
        else
        {
            if cellState.dateBelongsTo == .thisMonth
            {
                myCustomCell.dayLabel.textColor = UIColor.black
                if myCustomCell.dayLabel.text == "20" || myCustomCell.dayLabel.text == "30"
                {
                    myCustomCell.dayLabel.textColor = UIColor.green
                }
            }
            else
            {
                myCustomCell.dayLabel.textColor = UIColor.gray
            }
        }
    }
    
    // Function to handle the calendar selection
    func handleCellSelection(view: JTAppleDayCellView?, cellState: CellState) {
        
        guard let myCustomCell = view as? CellView  else { return }
        
        if cellState.isSelected
        {
            myCustomCell.selectedView.layer.cornerRadius =  20
            myCustomCell.selectedView.isHidden = false
        }
        else
        {
            myCustomCell.selectedView.isHidden = true
        }
    }
    
}

extension CalendarViewController: JTAppleCalendarViewDataSource, JTAppleCalendarViewDelegate, UITableViewDelegate, UITableViewDataSource {
    
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MM dd"
        
        let startDate = formatter.date(from: "2016 12 01")! // You can use date generated from a formatter
        let endDate = formatter.date(from: "2017 12 01")!  // You can also use dates created from this function
        let parameters = ConfigurationParameters(startDate: startDate,
                                                 endDate: endDate,
                                                 numberOfRows: 6, // Only 1, 2, 3, & 6 are allowed
                                                 calendar: Calendar.current,
                                                 generateInDates: .forAllMonths,
                                                 generateOutDates: .tillEndOfGrid,
                                                 firstDayOfWeek: .monday)
        return parameters
    }
    
    func calendar(_ calendar: JTAppleCalendarView, willDisplayCell cell: JTAppleDayCellView, date: Date, cellState: CellState) {
        
        
        
        let myCustomCell = cell as! CellView
        
        // Setup Cell text
        myCustomCell.dayLabel.text = cellState.text
        
        handleCellTextColor(view: cell, cellState: cellState)
        handleCellSelection(view: cell, cellState: cellState)
        
        // Setup text color
        if cellState.dateBelongsTo == .thisMonth
        {
            myCustomCell.dayLabel.textColor = UIColor.black
            if myCustomCell.dayLabel.text == "20" || myCustomCell.dayLabel.text == "30"
            {
                myCustomCell.dayLabel.textColor = UIColor.green
            }
            
        }
        else
        {
            myCustomCell.dayLabel.textColor = UIColor.gray
        }
        
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleDayCellView?, cellState: CellState) {
        let myCustomCell = cell as! CellView
        
        // Let's make the view have rounded corners. Set corner radius to 25
        myCustomCell.selectedView.layer.cornerRadius =  25
        
        handleCellSelection(view: cell, cellState: cellState)
        handleCellTextColor(view: cell, cellState: cellState)
        
//        let date = NSDate()
//        let calendar = NSCalendar.current
//        let seconds = calendar.component(.second, from: date as Date)
//        let minutes = calendar.component(.minute, from: date as Date)
//        let hour = calendar.component(.hour, from: date as Date)
//        let day = calendar.component(.day, from: date as Date)
//        let month = calendar.component(.month, from: date as Date)
//        let year = calendar.component(.year, from: date as Date)
        
        if cellState.isSelected {
            myCustomCell.selectedView.isHidden = false
            if myCustomCell.dayLabel.text == "20"
            {
                data = ["Birthday", "Bank", "Hospital"]
            }
            else if myCustomCell.dayLabel.text == "30"
            {
                data = ["Work", "Office"]
            }
            else
            {
                data = []
            }
            
        }
        tableView.reloadData()
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleDayCellView?, cellState: CellState) {
        let myCustomCell = cell as! CellView
        myCustomCell.selectedView.isHidden = true
        
        handleCellSelection(view: cell, cellState: cellState)
        handleCellTextColor(view: cell, cellState: cellState)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = data[indexPath.row]
        return cell!
    }

}

extension UIColor {
    convenience init(colorWithHexValue value: Int, alpha:CGFloat = 1.0){
        self.init(
            red: CGFloat((value & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((value & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(value & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}
