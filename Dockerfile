FROM intelanalytics/ipex-llm-inference-cpp-xpu:latest

ENV OLLAMA_NUM_GPU=999
ENV OLLAMA_NUM_PARALLEL=1
ENV OLLAMA_KEEP_ALIVE=-1
ENV SYCL_CACHE_PERSISTENT=1
ENV ZES_ENABLE_SYSMAN=1
ENV OLLAMA_HOST=0.0.0.0:11434

# [optional] under most circumstances, the following environment variable may improve performance, but sometimes this may also cause performance degradation
ENV SYCL_PI_LEVEL_ZERO_USE_IMMEDIATE_COMMANDLISTS=1
# [optional] if you want to run on single GPU, use below command to limit GPU may improve performance
ENV ONEAPI_DEVICE_SELECTOR=level_zero:0

RUN mkdir -p /llm/ollama; \
    cd /llm/ollama; \
    init-ollama;

WORKDIR /llm/ollama

ENTRYPOINT ["./ollama", "serve"]
