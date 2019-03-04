import UIKit

class TimeTableViewController: UITableViewController, DataTime {
    
    
    
//    var timePicker = UIPickerView()
//    var arrPicker = [UIPickerView()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDataTime()

//        for _ in 1..<24 {
//            arrPicker.append(timePicker)
//        }
//
//        arrPicker.forEach{
//            $0.delegate = self
//            $0.dataSource = self
//        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 24
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    

    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let timePicker = UIPickerView()
        var arrPicker = [UIPickerView()]
        
        for _ in 1..<24 {
            arrPicker.append(timePicker)
        }
        
        arrPicker.forEach{
            $0.delegate = self
            $0.dataSource = self
        }
        
        timePicker.delegate = self
        timePicker.dataSource = self
        
        cell.frame = CGRect(x: 0, y: 0, width: 320, height: 180)
        
        timePicker.frame = CGRect(x: 0, y: 0, width: cell.frame.width, height: cell.frame.height)
        
        
        print(timePicker.frame)
        print("cell \(cell.frame)")
        
        cell.addSubview(arrPicker[indexPath.row])
        
        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)" + "huy")
    }

}

extension TimeTableViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        createDataTime()
        switch component {
        case 0: return Time.hour.count
        case 1: return Time.minute.count
        case 2: return Time.second.count
        default: return 0
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        switch component {
        case 0: return String(Time.hour[row])
        case 1: return String(Time.minute[row])
        case 2: return String(Time.second[row])
        default: return ""
        }
    }
    
    //    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    //        if component == 0 && pickerTime.index(of: pickerView) == 0 {
    //
    //            for i in 1..<3 {
    //                pickerTime[i].selectRow((row + i) % 24, inComponent: 0, animated: true)
    //            }
    //        }
    
}


