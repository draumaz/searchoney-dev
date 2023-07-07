# draumaz/SearchOney
Welcome! This is a search engine for OneyPlays videos. It is current as of July 5th, 2023.

# Usage
- Go to the top right search box or hit ```/```, and type a query.
  - Use quotation marks to find match multi-word queries, like "hey Tomar" instead of just hey Tomar.

# Acknowledgments 
- All transcriptions are copyright OneyPlays, O'Neil et. al, 2014-23.
- Techstack highly inspired by [searchTAFS](https://searchtafs.net).
- Thanks to Marceline for conceptual design and theory.

# Nerdy stuff
- Compressed YouTube audio size: ```71GB```
- Uncompressed 16KHz audio size: ```329GB```
- Scraping & conversion: [yt-dlp](https://github.com/yt-dlp/yt-dlp), [ffmpeg](https://ffmpeg.org)
- Speech processing: [MacWhisper](https://github.com/ggerganov/whisper.cpp) and its ```base.en.bin``` model
