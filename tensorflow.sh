driver_version=390.48
cuda="cuda_9.0.176_384.81_linux-run"
cudnn="cudnn-9.0-linux-x64-v7.1.tar"

echo ----------
echo installing NVIDIA driver
echo ----------
sh /mnt/NVIDIA-Linux-x86_64-$driver_version.run -x
mv NVIDIA-Linux-x86_64-$driver_version /usr/local/
sh /mnt/links.sh $driver_version

echo ----------
echo installing CUDA
echo ----------

sh /mnt/$cuda  --toolkit --silent
tar xvf /mnt/$cudnn -C /usr/local

driver_path=/usr/local/NVIDIA-Linux-x86_64-$driver_version
echo " " >> /environment
echo "LD_LIBRARY_PATH=/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64:$driver_path:$LD_LIBRARY_PATH" >> /environment
echo "PATH=$driver_path:\$PATH" >> /environment
echo "export PATH LD_LIBRARY_PATH" >> /environment

export LC_ALL=C
pip install --no-cache-dir tensorflow-gpu==0.12.1
