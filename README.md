# RAG on GH200

Welcome to the repository! The intent is to provide clear steps to standing up a basic RAG example on a GH200 system.

## Requirements
- CUDA Driver Version 12.8
- NVIDIA Container Toolkit
- Docker 

//TODO insert info on ensuring correct driver versions <br>
//TODO insert info on ensuring nvidia-ctk and docker have appropiate runtimes steps <br>

**Login to nvcr.io with your NGC API key credentials.**

```
$ docker login nvcr.io
- Username: $oauthtoken
- Password: <Insert NGC key: nvapi-u6hwGp....>
```


## Quickstart 
_Last updated: 05-27-2025_

After performing some initial system checks and ensuring the container toolkit & engine are installed properly, it's time to stand up the RAG exmaple!

To make it easy for you to get started, here's the next steps to quickstart.

**Clone the repository and navigate into the appropiate directory.**
```
git clone https://github.com/NVIDIA/GenerativeAIExamples.git && cd GenerativeAIExamples/RAG/examples/basic_rag/langchain
```


```
$ cd RAG/examples/basic_rag/langchain
USERID=$(id -u) docker compose --profile local-nim --profile nemo-retriever --profile milvus up --build -d
```

Run `nvidia-smi` to see the memory usage of the RAG containers. 
```
$ nvidia-smi

Mon May 19 17:44:11 2025
+-----------------------------------------------------------------------------------------+
| NVIDIA-SMI 570.133.20             Driver Version: 570.133.20     CUDA Version: 12.8     |
|-----------------------------------------+------------------------+----------------------+
| GPU  Name                 Persistence-M | Bus-Id          Disp.A | Volatile Uncorr. ECC |
| Fan  Temp   Perf          Pwr:Usage/Cap |           Memory-Usage | GPU-Util  Compute M. |
|                                         |                        |               MIG M. |
|=========================================+========================+======================|
|   0  NVIDIA GH200 480GB             Off |   00000009:01:00.0 Off |                    0 |
| N/A   33C    P0             95W /  900W |   48427MiB /  97871MiB |      0%      Default |
|                                         |                        |             Disabled |
+-----------------------------------------+------------------------+----------------------+

+-----------------------------------------------------------------------------------------+
| Processes:                                                                              |
|  GPU   GI   CI              PID   Type   Process name                        GPU Memory |
|        ID   ID                                                               Usage      |
|=========================================================================================|
|    0   N/A  N/A          283213      C   /opt/nim/llm/.venv/bin/python3        45126MiB |
|    0   N/A  N/A          283410      C   milvus                                 1570MiB |
|    0   N/A  N/A          283908      C   tritonserver                           1712MiB |
+-----------------------------------------------------------------------------------------+

```

## Further Resources (NIMs, RAG)
- links to some blogs
- links to some documentation 
