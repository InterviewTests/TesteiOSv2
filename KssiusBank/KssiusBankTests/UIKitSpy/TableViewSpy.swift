//
//  TableViewSpy.swift
//  KssiusBankTests
//
//  Created by Cassio Sousa on 18/06/23.
//  Copyright © 2023 Cassio Sousa. All rights reserved.
//

import UIKit


final class TableViewSpy: UITableView {
    var reloadDataCalled = false
    var numberOfSectionsCalled = false
    var cellForRowCalled = false

    override func reloadData() {
        reloadDataCalled = true
    }

}
