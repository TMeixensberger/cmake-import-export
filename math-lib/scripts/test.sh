cmake .. -B ../build -DCMAKE_INSTALL_PREFIX:PATH="../Export"

cmake -DCMAKE_BUILD_TYPE=Debug ../build
cmake --build ../build --config Debug --target install

cmake -DCMAKE_BUILD_TYPE=Release ../build
cmake --build ../build --config Release --target install 
