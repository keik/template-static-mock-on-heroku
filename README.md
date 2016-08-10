# template-static-mock-on-heroku

Template for mocking static web site and deploying on heroku.

All resources will be built on heroku, so we have not to built resources on local and push them to remote.


## Installation

```
% git clone https://github.com/keik/template-static-mock-on-heroku.git my-mock
% cd my-mock
```

## Development

Edit resources (HTML, JS, CSS and some assets) in *src* directory, then build resources and distribute to *dist* directory on batch:

```
% make
```

To watch resources and incrementally build, with running local http server at *8080* port rooted on *dist* directory:

```
% make watch
```


## Deployment

At first only once, setup heroku:

```
% heroku create
% heroku config:set NPM_CONFIG_PRODUCTION=false
```

Deploy on heroku:

```
% git push heroku master
```

Then resources will be built and deploy on heroku. Confirm on browser:

```
% heroku open
```
