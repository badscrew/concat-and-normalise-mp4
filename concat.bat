set file-name=VBR-20

:: Create input File List
for %%i in (DJI*.mp4) do echo file '%%i'>> mylist.temp.txt

:: Concatenate input video files
ffmpeg -f concat -safe 0 -i mylist.temp.txt -c copy -hide_banner -loglevel warning -stats %file-name%.temp.mp4

:: Extract audio from video, apply loudness filter
ffmpeg -i %file-name%.temp.mp4 -filter:a loudnorm -hide_banner -loglevel warning -stats %file-name%.temp.aac

:: Merge temp video and temp audio back into final video
ffmpeg -i %file-name%.temp.mp4 -i %file-name%.temp.aac -c:v copy -map 0:v:0 -map 1:a:0 -hide_banner -loglevel warning -stats %file-name%.mp4

:: cleanup
rm %file-name%.temp.mp4
rm %file-name%.temp.aac
rm mylist.temp.txt

@echo ------------ FINISHED ENCODING ---------------