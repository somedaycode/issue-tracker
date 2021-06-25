//
//  MainNetworkManager.swift
//  issueTrackerApp
//
//  Created by zombietux on 2021/06/24.
//

import Foundation

class MainNetworkManager {
    private let cachingManager = CachingManager()
    
    func fetchValue<V: Decodable>(for url: URL) -> V? {
        let cachedValue: CachedValue<V>? = cachingManager.fetchValue(for: url)
        return cachedValue?.value
    }
}
