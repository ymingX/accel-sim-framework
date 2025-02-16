dataset -e

echo "==========Init NVBIT: Start========"
{
	echo "==========Init NVBIT: start========"
	./util/tracer_nvbit/install_nvbit.sh
	make -j 80 -C ./util/tracer_nvbit/
	echo "==========Init NVBIT: Finished====="
} > nvbit.log 2>&1 
echo "==========Init NVBIT: Finished====="


echo "==========Init gpu-app-collection: Start========"
{
        echo "==========Init gpu-app-collection: Start========"
        # Get the applications, their data files and build them:
        # git clone git@github.com:accel-sim/gpu-app-collection.git
        git clone git@github.com:ymingX/gpu-app-collection.git
        source ./gpu-app-collection/src/setup_environment
        # make -j -C ./gpu-app-collection/src all
        # make -C ./gpu-app-collection/src data

        # Run the applications with the tracer (remember you need a real GPU for this):
        # ./util/tracer_nvbit/run_hw_trace.py -B GPU_Microbenchmark -D <gpu-device-num-to-run-on>

        echo "==========Init gpu-app-collection: Finished====="
} >  gpu-app-collection.log 2>&1
echo "==========Init gpu-app-collection: Finished====="


echo "==========Init simulator: Start========"
{
        echo "==========Init simulator: Start========"
        pip install -r requirements.txt
        source ./gpu-simulator/setup_environment.sh
        make -j  -C ./gpu-simulator/
        echo "==========Init simulator: Finished====="
} >  simulator.log 2>&1
echo "==========Init simulator: Finished====="
