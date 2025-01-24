# Base image with ROS 2 Humble pre-installed
FROM ros:humble

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Update and install necessary dependencies
RUN apt-get update && apt-get install -y \
    software-properties-common \
    ros-humble-ros2-control \
    ros-humble-ros2-controllers \
    ros-humble-moveit 

# other dependencies like joint state publisher and robot state publisher and rviz
RUN apt-get update && apt-get install -y \
    ros-humble-joint-state-publisher \
    ros-humble-robot-state-publisher \
    ros-humble-rviz2

# create a ROS workspace and copy the PWD into the src directory
RUN mkdir -p /root/ros2_ws/src
COPY . /root/ros2_ws/src

# build the workspace
SHELL ["/bin/bash", "-c"] 
WORKDIR /root/ros2_ws
RUN . /opt/ros/humble/setup.bash && colcon build

# Source the ROS 2 setup script
RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc && \
    echo "source /root/ros2_ws/install/setup.bash" >> ~/.bashrc