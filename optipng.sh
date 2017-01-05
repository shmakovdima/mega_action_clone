#!/bin/bash

find -name *.jpg -exec jpegoptim --strip-all '{}' \;
find -name *.jpeg -exec jpegoptim --strip-all '{}' \;
find -name *.JPG -exec jpegoptim --strip-all '{}' \;
find -name *.JPEG -exec jpegoptim --strip-all '{}' \;
find -type f -name "*.png" -exec optipng {} \;
find -type f -name "*.PNG" -exec optipng {} \;