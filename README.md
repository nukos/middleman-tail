middleman-tail
=====================================
**middleman-tail** is the Skeleton to create a blog that uses a middleman 4.

### Feature
* Pre install and Settings
  * [middleman-blog](https://github.com/middleman/middleman-blog)
  * [middleman-syntax](https://github.com/middleman/middleman-syntax)
  * [middleman-ogp](https://github.com/ngs/middleman-ogp)
  * [middleman-s3_sync](https://github.com/fredjean/middleman-s3_sync)
  * [middleman-minify-html](https://github.com/middleman/middleman-minify-html)
* External pipeline support (Gulp)
  * Blowserify (browserify-shim)
  * Sass (Bourbon, Neat, Font-Awesome)
* Slim Templates
* Default timezone: Asia/Tokyo (UTC+9)


1, System dependencies
-------------------
* Ruby (2.3.1)
* node.js (6.6.0)
* [Bundler](http://bundler.io/) (1.13.5)
* [Middleman](https://middlemanapp.com/jp/) (4.1.10)
* [Gulp](https://github.com/gulpjs/gulp)
* [Browserify](http://browserify.org/)

2, Getting Started
------------

### 2.0, Install Skeleton

``` bash
$ middleman init PROJECTNAME -T nukos/middleman-tail
```

### 2.1, Install Gulp

``` bash
$ npm install
``` 

### 2.2, Start Server

``` bash
$ bundle exec middleman server
```

### 2.3, Build

``` bash
$ bundle exec middleman build
```

License
-------

Copyright (c) 2016 [whiskers]. MIT Licensed.

[whiskers]: http://whiskers.nukos.kitchen/
