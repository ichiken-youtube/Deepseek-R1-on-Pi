#参考
#https://qiita.com/akira-hagi/items/61b2752b9e8115c91ad8
#gguf変換済みモデル
#https://huggingface.co/bluepen5805/DeepSeek-R1-Distill-Qwen-14B-Japanese-gguf
#7Bモデル
#https://huggingface.co/lightblue/DeepSeek-R1-Distill-Qwen-7B-Japanese

FROM ollama/ollama

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Tokyo

RUN mkdir -p /root/.ollama/models

COPY models/*.gguf /root/.ollama/models/

COPY Modelfile /root/.ollama/models/Modelfile

RUN ollama serve &\
  sleep 5 &&\
  ollama create DeepSeek-R1-Distill-Qwen-7B-Japanese-Q4_K -f /root/.ollama/models/Modelfile

#RUN ollama serve &\
#  sleep 5 &&\
#  ollama pull huggingface.co/bluepen5805/DeepSeek-R1-Distill-Qwen-14B-Japanese-gguf:Q4_K_M
#デスクトップPCなどではこの14B日本語ファインチューニングモデルも使える
#キャッシュの都合でRUN文を分割していますが、実際ビルドしなおしたときに効率的なのかは不明です。

EXPOSE 11434
