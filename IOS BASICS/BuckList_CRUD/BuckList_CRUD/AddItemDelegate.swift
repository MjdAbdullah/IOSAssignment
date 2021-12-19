//
//  AddItemDelegate.swift
//  BuckList_CRUD
//
//  Created by admin on 19/12/2021.
//

import Foundation

protocol AddItemDelegate: class{
    func itemSaved(by controller: AddItemTableViewController, with text: String, at indexPath: NSIndexPath?)
    func cancelButtonPressed(by controller: AddItemTableViewController)
}
