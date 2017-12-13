# pyselfox

Yet another docker container containing Python (3.6), Selenium and Firefox (ESR). Docker build can be found [here](https://hub.docker.com/r/tehusername/pyselfox/).

## Why another one

* Most of the images available are either based from Alpine itself or from Python but with Jessie as its base. This one uses Alpine as its base! (gotta get myself on that empty niche).

* Have you ever tried playing with Python and Selenium but gave up halfway because of the confusing mess that is the dependencies you have to install? Well, this image is for you! Focus on doing what needs to be done and make it run on a myriad of different environments without ever having to reinstall stuff!

## Building the image

If you want from docker hub (recommended):

```bash
docker pull tehusername/pyselfox:latest
```

If you've checked out the repository:

```bash
docker build -t tehusername/pyselfox .
```

## Design Considerations

This image purposely does not include any default application code (there's no `COPY . ./src` in the Dockerfile) and is primarily aimed at being a disposable environment. Because of this, you need to mount a particular directory from your environment to the container's `./src` directory.

Upside of this is that if you generate any files from your application, it should be present on your machine as well.

#### Using `docker run` with a shell

```bash
docker run -it -v {absolute_path_to_your_app_code}:/src tehusername/pyselfox /bin/sh
```

You should now be inside the container, in the `/src` directory. To run your code, simply do `python app.py` and of you go.

#### Using `docker run` exclusively

Note: `app.py` should be present on the mounted volume.

```bash
docker run -v {absolute_path_to_your_app_code}:/src tehusername/pyselfox
```

#### Using `docker-compose`

Note: `app.py` should be present on the mounted volume.

This assumes you've already installed `docker-compose` (instructions [here](https://docs.docker.com/compose/install/)).

```bash
docker-compose up
```

This will immediately run your application code without any fuss. It'll also build your image if you haven't already. How neat is that?
