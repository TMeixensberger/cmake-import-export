outputDir="../output"
buildDir="${outputDir}/build"
exportDir="${outputDir}/export"
if [[ ! -d "$outputDir" ]]; then

  mkdir $outputDir

fi

cmake .. -B $buildDir -DCMAKE_INSTALL_PREFIX:PATH=$exportDir

cmake -DCMAKE_BUILD_TYPE=Debug $buildDir
cmake --build $buildDir --config Debug --target install

cmake -DCMAKE_BUILD_TYPE=Release $buildDir
cmake --build $buildDir --config Release --target install 
