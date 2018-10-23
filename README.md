# Random 
This is an open project to show a way to implement CLEAN architecture on our iOS apps. There's not only one way to implement it so this is my approach. For that reason, I was inspired on VIPER, MVP and MVVM architectures. The most important is to take the advantages of each architecture and create your own view. 
In this project I decided to have a big dependency of RxSwift, it's an example of a common situation when you are the owner of the project and you need to decide which dependencies you have and which you want to avoid.
But one thing for sure, working with tests is the most important, try to have tests for each layer and working with approach like TDD or ATTD. Because the tests give us a good perspective to build our architecture, meet the CLEAN principles and avoid lot of bugs in the future.


## Exercise

This project use [Moya](https://rometools.github.io/rome/) (Rx Wrapper works with [Alamofire](https://rometools.github.io/rome/)) as a Network Service client to obtain a list of users from [http://randomuser.me](http://randomuser.me), persist this obtained data on local storage with [Realm](http://randomuser.me), avoiding repetitions data. And render this data on a Master-Detail app, with a list of users and a detail for each one. Also have the posibility to search users by name, lastname or email.


## Architecture
This is the best approach of CLEAN architecture for iOS. We have some layers to share the logic around, each layer has his own responsibility.
You can see a visual scheme to understand better how it works:


![alt text](https://res.cloudinary.com/aka7/image/upload/v1540195508/Victor/Architectures/architecture.png)

* [View](https://rometools.github.io/rome/) - Customize UI
* [Presenter](https://rometools.github.io/rome/) - Presentation Logic
* [Router](https://rometools.github.io/rome/) - Navigation layer
* [Interface](https://rometools.github.io/rome/) - Business logic
* [Repository](https://rometools.github.io/rome/) - Bridge between data and business logic
* [Client](https://rometools.github.io/rome/) - Data layer, we can have DataBases, Network connections, Frameworks store, Memory, etc.


## Tests
For each project the developers should decide what approach of test pyramid they need or they want to have. My favorite is an approach from the practical test pyramid of Martin Fowler:

![alt text](https://res.cloudinary.com/aka7/image/upload/v1540333699/Victor/Architectures/TestPiramid.png)

At the moment this project only have the bottom layer, Unit Tests. 
But at one point I will add more tests for the other layers to show how can do it for iOS.

## API Reference

I use a third party service to obtain the random user lists. You can find out more about this service on:

[Random User](https://randomuser.me)

## Installation

```python
git clone 

cd /workdir

pod install

open Random.xcworkspace
```


## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)