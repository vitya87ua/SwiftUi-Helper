//
//  AppNotification.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 08.09.2022.
//

import Foundation

protocol AppNotificationObservable: AnyObject {
    func profileUpdated(_ notifier: AppNotification)
    func projectCreated(_ notifier: AppNotification)
    func projectRenamed(_ notifier: AppNotification)
}

extension AppNotificationObservable {
    func projectCreated(_ notifier: AppNotification) {}
    func profileUpdated(_ notifier: AppNotification) {}
    func projectRenamed(_ notifier: AppNotification) {}
}


protocol AppNotification {
    func addObserver(_ observer: AppNotificationObservable)
    func removeObserver(_ observer: AppNotificationObservable)
    func send(event: AppNotificationCenter.Events)
}

final class AppNotificationCenter: AppNotification {
    enum Events {
        case profileUpdated
        case projectCreated
        case projectRenamed
    }
    
    private struct Observation {
        weak var observer: AppNotificationObservable?
    }

    private var observations = [ObjectIdentifier : Observation]()

    func addObserver(_ observer: AppNotificationObservable) {
        let id = ObjectIdentifier(observer)
        observations[id] = Observation(observer: observer)
    }

    func removeObserver(_ observer: AppNotificationObservable) {
        let id = ObjectIdentifier(observer)
        observations.removeValue(forKey: id)
    }

    func send(event: Events) {
        for (id, observation) in observations  {
            guard let observer = observation.observer else {
                observations.removeValue(forKey: id)
                continue
            }
            switch event {
            case .profileUpdated:
                observer.profileUpdated(self)
            case .projectCreated:
                observer.projectCreated(self)
            case .projectRenamed:
                observer.projectRenamed(self)
            }
        }
    }
}

private struct AppNotificationKey: InjectionKey {
    static var currentValue: AppNotification = AppNotificationCenter()
}

extension InjectedValues {
    var appNotification: AppNotification {
        get { Self[AppNotificationKey.self] }
        set { Self[AppNotificationKey.self] = newValue }
    }
}

// MARK: - Usage

// Class1 catch Notifications
class Class1 {
    @Injected(\.appNotification) private var appNotification: AppNotification
    
    init() {
        appNotification.addObserver(self)
    }
}

extension Class1: AppNotificationObservable {
    func projectCreated(_ notifier: AppNotification) {
        // Do...
    }
}

// Class2 send Notifications
class Class2 {
    @Injected(\.appNotification) private var appNotification: AppNotification
    
    func someAction() {
        self.appNotification.send(event: .projectCreated)
    }
}
