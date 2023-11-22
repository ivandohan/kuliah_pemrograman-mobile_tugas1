# Tugas Mata Kuliah
# Pemrograman Mobile - Tugas 1

### ``Simple Directory App``

#### _In Progress_

## Pre-view
The image is too huge to be rendered. Click the following link to see the snapshots.


`1. Demo`

`2. Landing Screen`: [Click Here](./pm-t1-snapshots/landing-page1.png)


`3. Students Screen`: [Click Here](./pm-t1-snapshots/person-list.png)


`2. Student Detail Screen`: [Click Here](./pm-t1-snapshots/person-detail.png)


## Description
This application is primarily concerned with displaying detailed data from a number of students and professors who have been registered in the database.
The features are quite general and rudimentary, consisting only of standard CRUD operations.

## Tech Stack
This app is created using the _client-server_ architecture. As a result, the _client_ is the component that interacts 
with the user, whereas the _server_ is the component that processes the data transaction protocol, in this case we use RESTFul API.
The API is intended to be _**extremely simple, with no security.**_

**Client**: `Flutter`
**API Server**: `Gin-Gonic ~ Go`

## The Developers
* Ivandohan Samuel `@ivandohan`
* Deza Banjarnahor `@dezazzz`
* Steven Manurung `@steven_manurung`
* Vita Sariani `@vita`
* Trifine Laurensi `@trifine`

## Logs
* `[18/11/2023]` : Except for the _client_ side, the basic application has been constructed.
  The _API_ only supports the _GET_ method and retrieve data from inner _JSON_ files.
* `[20/11/2023]` : Make a client application with only two screens, Splash and Home. There is no extra functionality provided, just simply render a text.
* `[21/11/2023]` : Develop person list screen for students type only and its detail.
* `[22/11/2023]` : Add more styling and adjust some box-constraints. Student type screen is already set!

