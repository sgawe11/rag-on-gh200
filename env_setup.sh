#!/bin/bash

mkdir -p ~/.cache/model-cache
export MODEL_DIRECTORY=~/.cache/model-cache
export LOCAL_NIM_CACHE=~/.cache/nim
mkdir -p "$LOCAL_NIM_CACHE"

export APP_LLM_SERVERURL="nemollm-inference:8000"
export APP_EMBEDDINGS_SERVERURL="nemollm-embedding:8000"
export APP_RANKING_SERVERURL="ranking-ms:8000"
export APP_EMBEDDINGS_MODELNAME="nvidia/nv-embedqa-e5-v5"
export APP_RANKING_MODELNAME="nvidia/llama-3.2-nv-rerankqa-1b-v2"
export NIM_KVCACHE_PERCENT=0.4

echo "---- ENVIRONMENT VARIABLES SET UP ---  " 
echo $MODEL_DIRECTORY
echo $LOCAL_NIM_CACHE
echo $APP_LLM_SERVERURL
echo $APP_EMBEDDINGS_SERVERURL
echo $APP_RANKING_SERVERURL
echo $APP_EMBEDDINGS_MODELNAME
echo $APP_RANKING_MODELNAME
echo $NIM_KVCACHE_PERCENT
echo " --------- " 
