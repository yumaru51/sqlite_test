import discord
from discord.ext import commands
import pyttsx3  # 読み上げエンジン
from pydub import AudioSegment  # 音声再生ライブラリ
from pydub.playback import play  # 音声再生ライブラリ
import asyncio
import os


# discord
intents = discord.Intents.default()
intents.presences = True
intents.members = True  # メンバー情報を取得するために必要
intents.messages = True  # メッセージ関連の権限を有効化
intents.message_content = True  # サーバーからメッセージを取得するのに必要！
bot = commands.Bot(command_prefix='!', intents=intents)
server_id = 1084441291041026138
text_channel_id = 1084441291041026141
voice_channel_id = 1084441291531755570

# pyttsx3
# テキスト読み上げエンジンの初期化
engine = pyttsx3.init()

# PATHにffmpegが含まれていない場合
ffmpeg_path = "/usr/local/bin/ffmpeg"
AudioSegment.ffmpeg = ffmpeg_path
AudioSegment.ffprobe = ffmpeg_path


# ボイスチャンネルに接続する関数
async def join_voice_channel(voice_channel):
    await voice_channel.connect()


# ボイスチャンネルから切断する関数
async def leave_voice_channel():
    for voice_channel in bot.voice_clients:
        await voice_channel.disconnect()


# メッセージが送信されたらボイスチャンネルで読み上げる関数
async def read_message(message):
    # メッセージをテキストとして取得
    text = message.content
    engine.save_to_file(text, 'message.mp3')
    engine.runAndWait()

    voice_client = message.guild.voice_client
    source = await discord.FFmpegOpusAudio.from_probe('message.mp3')
    voice_client.play(source)


@bot.event
async def on_ready():
    server = bot.get_guild(server_id)
    channel = bot.get_channel(text_channel_id)
    await channel.send('agurun_bot wake up')  # メッセージを送信する
    print(f'{bot.user.name} has connected to {server.name}!')


# 返信する非同期関数を定義
async def reply(message):
    reply_message = f'{message.author.mention} 呼んだ？'  # 返信メッセージの作成
    await message.channel.send(reply_message)  # 返信メッセージを送信


async def voice(message):
    # DiscordのVCチャンネルで音声を再生する例
    voice_channel = discord.utils.get(message.guild.voice_channels, name='一般')
    if voice_channel:
        if not message.guild.voice_client:
            voice_client = await voice_channel.connect()
        else:
            voice_client = message.guild.voice_client
        source = await discord.FFmpegOpusAudio.from_probe('message.mp3')
        voice_client.play(source)
    else:
        await message.channel.send("指定された音声チャンネルが見つかりませんでした。")
    return


# 発言時に実行されるイベントハンドラを定義
@bot.event
async def on_message(message):
    # メッセージ送信者がBotだった場合は無視する
    if message.author.bot:
        return

    # message.content or message.clean_content or message.content.startswith
    if message.content.startswith('!agurun_bot join'):
        voice_channel = message.author.voice.channel
        await join_voice_channel(voice_channel)
    elif message.content.startswith('!agurun_bot leave'):
        await leave_voice_channel()
    elif message.clean_content.startswith('/neko'):
        await message.channel.send('にゃーん')
    elif message.content.startswith('oi'):
        await message.channel.send('hi')
    else:
        if bot.voice_clients:
            await read_message(message)

    if bot.user in message.mentions:  # 話しかけられたかの判定
        await reply(message)  # 返信する非同期関数を実行

    # メッセージ内容を取得する
    print(f'SendUser:{message.author}、'
          f'server:、'
          f'Channel:{message.channel}、' 
          f'Message: {message.content}')


@bot.command(name='ping')
async def ping(ctx):
    await ctx.send('pong')


bot.run('MTA4NDQyNTE3Nzc2MjM2NTQ1MA.GgFECu.-1xJV3AyyCr-Cz1wasxlPK_Fk23vv6bC0gzBFY')
