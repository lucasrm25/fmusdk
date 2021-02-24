mkdir -p debug
cd debug
cmake -DCMAKE_BUILD_TYPE=Debug ..
# cmake -S . -B build --trace-source=CMakeLists.txt
make clean
make VERBOSE=1
make test
echo ""
cd ..

# readelf -d ./temp/fmu20/me/springDamper/binaries/linux64/springDamper.so

# mkdir -p build
# cd build
# cmake -DCMAKE_BUILD_TYPE=Release ..
# make
# make test