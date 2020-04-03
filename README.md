# Mooncake analytics
A simple website displaying dynamic analytics for Mooncake. 


## Dependencies
This website is entirely developed using [Dart web](https://dart.dev/web). The following dependencies are required: 

- Dart `2.7.0` or greater. You can get it [here](https://dart.dev/get-dart). 
- The Dart web CLI tools. You can get them [here](https://dart.dev/tutorials/web/get-started#3-get-cli-tools-or-an-ide-or-both). 

Once you've installed both, make sure you edit your `PATH` variable to be: 

```
PATH="$PATH:$HOME/.pub-cache/bin"
```

## Building
### Development
To run this project locally, you can execute the following command: 

```shell
webdev serve --auto=refresh
```

### Production
To build this project for a production website, run the following: 
```shell
webdev build
```

You will find the output of the build inside the `build` folder. 
