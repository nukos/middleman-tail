middleman-tail
=====================================
**middleman-tail** is the Skeleton to create a blog that uses a middleman 4.

1, System dependencies
-------------------
* [rbenv](https://github.com/sstephenson/rbenv) (Ruby: 2.3.1)
* [ndenv](https://github.com/riywo/ndenv) (node.js: 6.6.0)
* [bundler](http://bundler.io/) (1.13.5)
* [middleman](https://middlemanapp.com/jp/) (4.1.10)
* [gulp](https://github.com/gulpjs/gulp)

### 1.1, Feature
* Pre install and Settings
  * middleman-blog
  * middleman-syntax
  * middleman-ogp
  * middleman-s3_sync
  * middleman-minify-html
* External pipeline support (Blowserify and Sass using Gulp)
  * Blowserify
  * Sass(Bourbon and Neat)
* Slim Templates
* Default timezone: Asia/Tokyo (UTC+9)

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
