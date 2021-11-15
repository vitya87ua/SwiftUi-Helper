//
//  VersionAttributes.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 15.11.2021.
//

import Foundation

class SomeName {

    // MARK: - Marking whole methods and classes with
    @available(iOS 15.0, *)
    func doSome() {
        // Body
    }

    @available(iOS 15.0, macOS 10.12, *)
    func doSome1() {
        // Body
    }

    @available(swift 3.0.2)
    func doSome2() {
        // Body
    }

    @available(iOS, deprecated: 13.0, obsoleted: 14.0, message: "Because !")
    func myFunc() {
        // deprecated from iOS13, and obsoleted after iOS14, the message "Because !" is displayed in XCode warnings
    }

    @available(iOS, introduced: 15.0, message: "Hello, world!")
    func myFunc2() {
        // myFunc2()' is only available in iOS 15.0 or newer
    }

    @available(macOS, unavailable, message: "Unavailable on macOS")
    func macOSList() {
        // 'macOSList()' is unavailable in macOS: Unavailable on macOS
    }


    // MARK: - Automatic operating system API availability checking
    func doSome3() {
        if #available(iOS 15, *) {
            // do
        } else {
            // do else
        }
    }


    // MARK: - Manual version checking
    func doSome4() {
        if ProcessInfo().isOperatingSystemAtLeast(OperatingSystemVersion(majorVersion: 14, minorVersion: 13, patchVersion: 0)) {
            // do
        }
    }


    // MARK: - Checking DEBUG mode
    #if DEBUG
      // do
    #endif

    // os version
    #if os(iOS)
      // do
    #endif


    // MARK: - Warning & Error
    #warning("This is bad method of encryption")

    // #error("This is bad method of encryption") - this "#error" doesn`t allow build project


    // MARK: - Marks methouds

    @available(*, deprecated, message: "Parse your data by hand instead")
    func parseData() { }

    @available(*, deprecated, renamed: "loadData")
    func fetchData() { }

    @available(swift, obsoleted: 4.1, renamed: "attemptConnection")
    func testConnection() { }

    @available(swift, deprecated: 4.0, obsoleted: 5.0, message: "This will be removed in v5.0; please migrate to a different API.")
    func testNewConnection() { }

    @available(swift, introduced: 4.2)
    func loadUsers() { }
}
