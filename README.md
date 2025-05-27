# RAG on GH200

Welcome to the repository! The intent is to provide clear steps to standing up a basic RAG example on a GH200 system.

## Requirements
- CUDA Driver Version 12.8
- NVIDIA Container Toolkit
- Docker 

//TODO insert info on ensuring nvidia-ctk and docker have appropiate runtimes steps <br>


## Quickstart 
_Last updated: 05-27-2025_

After performing some initial system checks and ensuring the container toolkit & engine are installed properly, it's time to stand up the RAG exmaple!

To make it easy for you to get started, here's the next steps to quickstart.

**1. Login to nvcr.io with your NGC API key credentials.**

```
$ docker login nvcr.io
- Username: $oauthtoken
- Password: <Insert NGC key: nvapi-u6hwGp....>
```

**2. Clone the repository and navigate into the appropiate directory.**
```
git clone https://gitlab-master.nvidia.com/msorkin/rag-on-gh200.git && cd rag-on-gh200
```

**3. It's time to set up some environment variables and folders. Run these commands in terminal.**
```
$ export NGC_API_KEY="<YOUR_NGC_API_KEY>"
$ mkdir -p ~/.cache/model-cache
$ export MODEL_DIRECTORY=~/.cache/model-cache
$ export LOCAL_NIM_CACHE=~/.cache/nim
$ mkdir -p "$LOCAL_NIM_CACHE"

```

**4. Check the uid, and then exit before we run some `sudo chown ...` commands.**
```
$ docker run --rm -it nvcr.io/nim/meta/llama-3.1-8b-instruct:1.8.4 bash
$ id
EXAMPLE OUTPUT: 
uid=1000(nim) gid=1000(nim)  ... ...
$ exit
```

**5. If the `uid` is not `1000`, replace commands with the correct uid values. Else, simply run these commands in terminal.**
```
$ sudo chown -R 1000:1000 ~/.cache/model-cache
$ sudo chmod -R 775 ~/.cache/model-cache
$ sudo chown -R 1000:1000 ~/.cache/nim
$ sudo chmod -R 775 ~/.cache/nim
```

**6.Set up more environment variables**
```
$ export APP_LLM_SERVERURL="nemollm-inference:8000"
$ export APP_EMBEDDINGS_SERVERURL="nemollm-embedding:8000"
$ export APP_RANKING_SERVERURL="ranking-ms:8000"
$ export APP_EMBEDDINGS_MODELNAME="nvidia/nv-embedqa-e5-v5"
$ export APP_RANKING_MODELNAME="nvidia/llama-3.2-nv-rerankqa-1b-v2"
$ export NIM_KVCACHE_PERCENT=0.4

```

**7. Everything should be set up! Let's spin up the RAG solution. Run this command to deploy the containers/** 
```
$ cd RAG/examples/basic_rag/langchain
USERID=$(id -u) docker compose --profile local-nim --profile nemo-retriever --profile milvus up --build -d
```


**8. Run `nvidia-smi` to see the memory usage of the RAG containers. Verify that your processes align to the expected GPU memory usage.** 
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

**9. The final step is to verify the RAG solution, there are a series of steps for this.**

In a new terminal, we need to set up a port tunnel to our server. 

```
ssh -L 9999:localhost:8071 nvidia@10.185.125.XX
- Password: <insert password>
```

Open up a tab in your browser. Go to this URL http://localhost:9999/docs#/. 

Upload a `.txt` document.
> You should see something akin to `"message": "File uploaded successfully"`




## Further Resources (NIMs, RAG)
- links to some blogs
- links to some documentation 
