cp -r ~/Templates/cpp-template $1
cd $1/build
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ./..
ln -s build/compile_commands.json ./..
make
cd ./..
git init
