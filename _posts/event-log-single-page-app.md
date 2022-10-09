---
title: "Event Log: a single-page app"
description: A weekend project from October 2022
date: October 9, 2022
---

Event Log
===

This is something I built in an hour yesterday because my wife wanted an app to track when the baby kicks.
The whole thing runs in and all data is stored in the browser.
I used `create-react-app` with a progressive web app template so the app can be downloaded to your home screen (on iOS just open in Safare and click share).
You can't share sessions between devices, but you can reload the website or close the tab and data will persist.

```
npx create-react-app my-app --template cra-template-pwa-typescript
```

The app is located [here](/events).