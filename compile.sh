mkdir debug
cd debug
cmake -DCMAKE_BUILD_TYPE=Debug ..
make clean
make
make test

echo ""

cd ..

readelf -d ./temp/fmu20/me/springDamper/binaries/linux64/springDamper.so

# mkdir build
# cd build
# cmake -DCMAKE_BUILD_TYPE=Release ..
# make
# make test