outputDir=".."
buildDir="${outputDir}/build"
exportDir="../export"

echo "------------"
echo $outputDir
echo $buildDir
echo $exportDir 
echo "------------"

cmake . -B $buildDir
