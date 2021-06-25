//
//  CachingManager.swift
//  issueTrackerApp
//
//  Created by zombietux on 2021/06/24.
//

import Foundation

struct CachedValue<T> {
    let value: T
    let isStale: Bool
}

protocol Caching {
    var cacheSize: Bytes { get }
    var entries: [StoredEntry] { get }
    func fetchValue<T: Decodable>(for url: URL) -> StoredValue<T>?
    func store<T: Encodable>(value: T, for url: URL)
    func removeValue(for url: URL)
}

class CachingManager {
    let cacheManager = FileSystemCacheManager()
    
    func fetchValue<V: Decodable>(for url: URL) -> CachedValue<V>? {
        guard let storedValue: StoredValue<V> = cacheManager.fetchValue(for: url) else {
            return nil
        }
        let expirationTime: TimeInterval = 60 * 10
        let isStale = Date().timeIntervalSince(storedValue.date) > expirationTime
        return CachedValue(value: storedValue.value, isStale: isStale)
    }
    
    func store<V: Encodable>(value: V, for url: URL) {
        func reduceCacheSizeIfNeeded() {
            let maximumCacheSize: Bytes = 1024 * 1024 * 10
            guard cacheManager.cacheSize > maximumCacheSize else {
                return
            }
            let sortedEntries = cacheManager.entries.sorted(by: { $0.date < $1.date })
            for entry in sortedEntries {
                guard cacheManager.cacheSize > maximumCacheSize else {
                    break
                }
                cacheManager.removeValue(for: entry.url)
            }
        }
        
        cacheManager.store(value: value, for: url)
        reduceCacheSizeIfNeeded()
    }
}

// MARK: - StoredValue
struct StoredValue<T> {
    let value: T
    let date: Date
}

// MARK: - StoredEntry
struct StoredEntry {
    let url: URL
    let date: Date
    let size: Bytes
}

// MARK: - CachingPolicy
extension CachingManager {
    struct CachingPolicy {
        static let expirationTime: TimeInterval = 60 * 10
        static let maximumCacheSize: Bytes = 1024 * 1024 * 10
        
        static func isCacheSizeOverLimit(cacheSize: Bytes) -> Bool {
            return cacheSize > maximumCacheSize
        }
        
        static func cachedValue<V>(from storedValue: StoredValue<V>, withCurrentDate date: Date) -> CachedValue<V> {
            let isStale = date.timeIntervalSince(storedValue.date) > expirationTime
            return CachedValue(value: storedValue.value, isStale: isStale)
        }
        
        static func entriesToRemove(from entries: [StoredEntry]) -> [StoredEntry] {
            let sortedEntries = entries.sorted(by: { $0.date < $1.date })
            var entriesToRemove: [StoredEntry] = []
            var remainingSize = sortedEntries.reduce(Bytes(0)) { $0 + $1.size }
            for entry in sortedEntries {
                guard remainingSize > maximumCacheSize else {
                    break
                }
                entriesToRemove.append(entry)
                remainingSize -= entry.size
            }
            return entriesToRemove
        }
    }
}
