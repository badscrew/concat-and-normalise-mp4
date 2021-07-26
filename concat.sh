# Create File List
rm -f mylist.txt
for f in DJI*.MP4; do echo "file '$f'" >> mylist.txt; done

# Concatenate Files
ffmpeg -f concat -safe 0 -i mylist.txt -c copy Final.mp4
