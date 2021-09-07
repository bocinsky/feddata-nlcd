cd NLCD/raw
rm -r */
rm -rf ../cogs/*
xargs -n 1 -P 0 curl -C - -O -s < ../../nlcd-downloads.txt

find . -type f -name '*.zip' -print | parallel -j+0 "unzip -qq {} -d {.} && gdal_translate -q {.}/{.}.img ../cogs/{.}.tif -of COG -co COMPRESS=DEFLATE && rm -r {.}"

rm -r */
cd ../../
