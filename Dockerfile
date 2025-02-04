#参考
#https://qiita.com/akira-hagi/items/61b2752b9e8115c91ad8
#gguf変換済みモデル
#https://huggingface.co/bluepen5805/DeepSeek-R1-Distill-Qwen-14B-Japanese-gguf
#7Bモデル
#https://huggingface.co/lightblue/DeepSeek-R1-Distill-Qwen-7B-Japanese

FROM ollama/ollama

# タイムゾーン設定のための環境変数を設定
#NV DEBIAN_FRONTEND=noninteractive
#ENV TZ=Asia/Tokyo

# モデルを保存するディレクトリを作成
RUN mkdir -p /root/.ollama/models

COPY models/*.gguf /root/.ollama/models/

COPY Modelfile /root/.ollama/models/Modelfile

RUN ollama serve & sleep 5 
RUN ollama create DeepSeek-R1-Distill-Qwen-7B-Japanese-Q4_K -f /root/.ollama/models/Modelfile

EXPOSE 11434

#CMD ["ollama", "serve"]