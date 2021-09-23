cmake .. -B ../build
cmake -DCMAKE_INSTALL_PREFIX:PATH="../Export" ../build

cmake -DCMAKE_BUILD_TYPE=Debug ../build
cmake --build ../build --config Debug --target install 

REM cmake -DCMAKE_BUILD_TYPE=Release ../build
REM cmake --build ../build --config Release --target install 