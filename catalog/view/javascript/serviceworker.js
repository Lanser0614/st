// Name our cache
const CACHE_NAME = "cache-v1";

const urlsToCache = ["index.html", "offline.html"];

const self = this;

// The first time the user starts up the PWA, 'install' is triggered.
self.addEventListener("install", (event) => {
    event.waitUntil(
        caches.open(CACHE_NAME).then((cache) => {
            console.log("Cached");
            return cache.addAll(urlsToCache);
        })
    );
});

// When the webpage goes to fetch files, we intercept that request and serve up the matching files
// if we have them
self.addEventListener("fetch", (event) => {
    event.respondWith(
        caches.match(event.request).then(() => {
            return fetch(event.request).catch(() => caches.match("offline.html"));
        })
    );
});

// Delete old caches that are not our current one!
self.addEventListener("activate", (event) => {
    const cacheWhitelist = [];
    cacheWhitelist.push(CACHE_NAME);

    event.waitUntil(
        caches.keys().then((keyList) =>
            Promise.all(
                keyList.map((key) => {
                    if (!cacheWhitelist.includes(key)) {
                        return caches.delete(key);
                    }
                })
            )
        )
    );
});
