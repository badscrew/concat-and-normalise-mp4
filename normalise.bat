set file-name=VBR-20

:: Extract audio from video, apply loudness filter
ffmpeg -i %file-name%.mp4 -filter:a loudnorm -hide_banner -loglevel warning -stats %file-name%.aac

:: Merge temp video and temp audio back into final video
ffmpeg -i %file-name%.mp4 -i %file-name%.aac -c:v copy -map 0:v:0 -map 1:a:0 -hide_banner -loglevel warning -stats %file-name%.norm.mp4

@echo ------------ FINISHED NORMALISING ---------------