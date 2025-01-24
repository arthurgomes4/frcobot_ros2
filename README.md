# frcobot_ros2
This is the ROS2 API project of Fairino robot(sofeware version must greater than V3.7.1), a serial of functions which based on Fair SDK API but were simplified are created, user can call them through service message.
API_description.md list all API functions.
Tutorial of installing and uasage of ROS2 API, please refer to the Fair document platform:https://fair-documentation.readthedocs.io/en/latest/ROSGuide/index.html#frcobot-ros2.

Version histroy:
2023.7.18 V1.0

## Install Hardware Simulator
The Fairino Simulator comes packaged in a docker image. Download the image from [here](https://fair-documentation.readthedocs.io/en/latest/download.html#fairino-simmachine). Once downloaded, follow the [instructions](https://fair-documentation.readthedocs.io/en/latest/VMMachine/controller_virtual_machine.html#virtual-machine-docker) to load the image, create a docker network and run it. Skip steps that involve the installation of docker itself (you can do that from the docker website).

**Note**: The webpage interface for the simulator should be accessible at `192.168.58.2` if the default steps have been followed. However, it is in Chinese by default, so you may need to use in-browser translation to understand the interface. The simulator container should be controllable with `docker stop fairino-container` and `docker start fairino-container` if the default name was used.

## Build the ROS2 packages
the ROS2 packages in this repository contain, the ROS2 control hardware interface implemented for the Fairino Cobot and moveit config packages for different robot models. To build the packages, follow the instructions below:

1. Clone the repository.
2. Use the following command to build the packages:
    ```bash
    ./use_docker --build
    ```
3. Run the container with:
    ```bash
    ./use_docker --run
    ```
4. Enter the container to run commands with:
    ```bash
    ./use_docker --enter
    ```
5. Once inside the container, Run a demo:
    ```bash
    ros2 launch fairino5_v6_moveit2_config demo.launch.py
    ```
6. To stop the container use:
    ```bash
    ./use_docker --stop
    ```