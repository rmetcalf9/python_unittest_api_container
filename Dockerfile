#This dockerfile builds a container image with python and rednose installed so we can test
# another built container.
# it it is designed to be launched and linked to the running container to preform the tests
# source code is not embedded in the image - it is attached

FROM alpine
MAINTAINER Robert Metcalf

COPY ./requirements.txt /requirements.txt

RUN apk add --no-cache bash python3 curl python3-dev build-base linux-headers pcre-dev libffi-dev && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    rm -r /root/.cache && \
    pip3 install --upgrade pip && \
    pip3 install -r requirements.txt && \
    mkdir /ext_volume

COPY ./scripts/* /usr/bin/

RUN chmod +x /usr/bin/run_tests_with_wait && \
    chmod +x /usr/bin/run_tests_in_passed_location_with_wait


ENTRYPOINT ["/bin/bash"]


#To test locally
#docker build -t python_unittest_api_contianer_localbuild .
