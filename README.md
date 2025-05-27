# RAG on GH200

Welcome to the repository! The intent is to provide clear steps to standing up a basic RAG example on a GH200 system.

## Requirements
- Updated CUDA Driver Version
- NVIDIA Container Toolkit
- Docker 

[i] insert info on ensuring correct driver versions <br>
[i] insert info on ensuring nvidia-ctk and docker have appropiate runtimes steps <br>
```
nvidia-ctk runtime configure --runtime=docker
systemctl restart docker
docker info | grep -i runtime

vi /etc/docker/daemon.json
```

Edit daemon.json file to include the following. Save the modified file. 
> Using VIM file editor: Press i to edit/insert, Use arrow keys to navigate in the file, Press Esc to leave editing mode, and make sure to type in wq! in VIM to properly save edits & quit VIM mode.
```
{
  "runtimes": {
    "nvidia": {
      "path": "nvidia-container-runtime",
      "runtimeArgs": []
    }
  }, # ADD COMMA
  "default-runtime": "nvidia" # ADD THIS LINE
}
```
[i] insert some system checks? <br>

```
systemctl restart docker
docker login nvcr.io
```

## Quickstart 
_last updated: X-X-XXXX_

After performing some initial system checks and ensuring the container toolkit & engine are installed properly, it's time to stand up the RAG exmaple!

To make it easy for you to get started, here's the next steps to quickstart.

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
