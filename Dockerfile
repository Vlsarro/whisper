# Container Version	    Ubuntu	    CUDA Toolkit	    PyTorch	            TensorRT
# 21.07	                20.04	    NVIDIA CUDA 11.4.0	1.10.0a0+ecc3718	TensorRT 8.0.1.6
FROM nvcr.io/nvidia/pytorch:21.07-py3

RUN apt-get update && \
    apt-get upgrade --yes && \
    DEBIAN_FRONTEND="noninteractive" apt-get --yes --option Dpkg::Options::="--force-confnew" --no-install-recommends install \
    ffmpeg

COPY . /whisper

RUN pip install /whisper

ENTRYPOINT ["tail", "-f", "/dev/null"]
