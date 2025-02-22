#!/bin/bash

APT_IN="apt-get install -y"
APT_IN_NR="apt-get install -y --no-install-recommends"

if [ $UID != 0 ]
then
  echo "Please run this script with sudo: sudo $0"
  exit 1
fi

echo "Dependencies"
apt-get update
apt-get upgrade
apt-get install python3-dev
apt-get install -y build-essential

apt-get remove glpk
apt-get remove libglpk-dev
apt-get remove libglpk0
sudo -u $SUDO_USER wget -O glpk-4.55.tar.gz http://ftp.gnu.org/gnu/glpk/glpk-4.55.tar.gz
sudo -u $SUDO_USER tar -xvhf glpk-4.55.tar.gz
cd glpk-4.55
./configure
make
make install
cd ..

apt-get install -y libglpk-dev
apt-get install -y libglpk0
apt-get install -y bison
sudo -u $SUDO_USER wget -O bison-3.0.2.tar.gz http://ftp.gnu.org/gnu/bison/bison-3.0.2.tar.gz
sudo -u $SUDO_USER tar -xhvf bison-3.0.2.tar.gz
cd bison-3.0.2
./configure
make
make install
cd ..

# Link change & Added GMP and M4
apt-get install -y libgmp-dev m4 
wget https://www.bugseng.com/products/ppl/download/ftp/releases/1.2/ppl-1.2.tar.gz
tar -xhvf ppl-1.2.tar.gz
cd ppl-1.2
sudo ./configure
sudo make
sudo make install
cd ..

apt-get install libboost-dev
apt-get install libboost-python-dev



#python 
apt-get remove python3-numpy
# Doesn't work: apt-get install -y python3-pip
# python3 -m pip install --upgrade pip
wget https://bootstrap.pypa.io/pip/3.5/get-pip.py
python3 get-pip.py
pip3 install sympy
pip3 install numpy
apt-get install -y python3-tk
pip3 install scipy
apt-get install -y python3-ply
apt-get install -y libtiff-dev libjpeg8-dev zlib1g-dev libfreetype6-dev liblcms2-dev libwebp-dev tcl8.5-dev tk8.5-dev python-tk
pip3 install Pillow
apt-get install -y git

sudo apt-get install python3-pil.imagetk


git clone https://github.com/oblalex/gnuplot.py-py3k.git
cd gnuplot.py-py3k/
python3 setup.py install
cd ..
apt-get install -y python-gnuplot

# Bokeh plotting requirements

sudo pip3 install bokeh==1.4.0
sudo pip3 install selenium
sudo apt install nodejs-legacy
sudo apt install npm
sudo npm install -g phantomjs-prebuilt

# Eigen library for backends

wget https://gitlab.com/libeigen/eigen/-/archive/3.3.7/eigen-3.3.7.tar.gz
tar xzf eigen-3.3.7.tar.bz2

#Removes compressed files

rm *.tar.bz2
rm *.tar.gz
rm *.zip

# Links due to changed directory names
ln -s eigen-3.3.7 eigen-eigen-323c052e1731
