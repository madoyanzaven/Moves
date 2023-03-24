# Movies
A sample app which utilizes [Get all movies](https://api.themoviedb.org/3/discover/movie) to display a movie list and
[Get detail](https://api.themoviedb.org/3/movie/{movieId}) detail screen.
* API key to authenticate your requests : c9856d0cb57c3f14bf75bdc6c063b8f3

[API documentation](https://developers.themoviedb.org/3/discov er/movie-discover)
### Architecture
*MVVM (Model-View-ViewModel) + Coordinator

### Built With
* Swift, RxSwift, UIKit + UI as code
* Dependency Injection - Swinject
* Network - URLSession, JSONDecoder
* Tests - XCTestCase

### Good practices followed
* Single responsibility of solid principle
* Dependency inversion principle
* DRY principles
* Clean architecture

##### Commit strategy
* Commit for each unit code
* Single-Purpose Commits

### If future-proof
In the project all layers are abstract, which allows to organize dependency flow, it is also easier for testing and preferable for scalable applications.

### Additional info
For continuing development proccess in case of server issue, in the project implemented layer for displaying mock data, which allows developer and QA spetialist continue process and reach necessary screen without any problem(
MovesWeb: for real API
MovesMock: for Mock response
)

### Time it took
It took a full development day, development process was without strasess.

