# syntax=docker/dockerfile:1

FROM ubuntu:latest

# copy the ./src directory into the app
COPY src/. /usr/src
# set the app working directory
WORKDIR /usr/src

# update apt
RUN apt-get update -y

# install c++
RUN apt-get install -y build-essential
# install cmake
RUN apt install -y cmake

# Now, into cmake territory..
# make the build directory
RUN mkdir ./build

# run ./cmake && ./make
RUN cmake -S . -B ./build && \
    make -C ./build

# run the executable
CMD ["./build/cpp20_example"]


