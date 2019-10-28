#!/bin/bash

#docker run --rm -v $(pwd):/data -t wata727/tflint
tflint
if [ $? != 0 ]; then
  #exit 1
  echo "Error"
fi

