import pyttsx3

# テキスト読み上げエンジンの初期化
engine = pyttsx3.init()
# 読み上げるテキストの設定
text = "Hello, world!"
# テキストを読み上げる
engine.say(text)
# 読み上げの開始
engine.runAndWait()

