# Windows command line utilities for concatenating and normalising video files

* These are .bat files to be used on Windows computers from command prompt
* No video reencoding is done, this speeds up the processing considerably, especially on computers with slow GPUs or no GPU. 
* No video reencoding also means there is no video quality loss at all.
* Developed and tested for mp4 files produced by DJI Osmo Action but should work fine with other action cameras that produce mp4

## Prerequisites

* Install ffmpeg utilities for Windows. The ffmpeg.exe file should be in user or system path - otherwise need to call it by its full path.

## Files

**normalise.bat** - normalisation only. Extracts AAC audio using loudness normalisation filter then merges the audio stream into new video.

**concat.bat** - creates a list of files having the DJI*.mp4 pattern and contatenates them into one video file, then normalises the audio loudness
