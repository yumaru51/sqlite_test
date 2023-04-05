from pydub import AudioSegment
from pydub.playback import play

# PATHにffmpegが含まれていない場合
ffmpeg_path = "/usr/local/bin/ffmpeg"
AudioSegment.ffmpeg = ffmpeg_path
AudioSegment.ffprobe = ffmpeg_path

# 音声ファイルの読み込み
sound = AudioSegment.from_file("レコーディング.m4a", format="m4a")

# 再生
play(sound)
